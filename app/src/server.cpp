#include "httplib.h"

#include <iostream>
#include <fstream>
#include <string>
#include <array>
#include <cstdio>

using namespace std;

string executeCommand(const char* cmd) {

    array<char, 128> buffer;
    string result;

    FILE* pipe = popen(cmd, "r");

    if (!pipe)
        return "Error";

    while (fgets(buffer.data(), 128, pipe) != nullptr) {
        result += buffer.data();
    }

    pclose(pipe);

    return result;
}

float getRAMUsage() {

    ifstream file("/proc/meminfo");

    string line;

    long total = 0;
    long available = 0;

    while (getline(file, line)) {

        if (line.find("MemTotal:") == 0)
            sscanf(line.c_str(), "MemTotal: %ld kB", &total);

        if (line.find("MemAvailable:") == 0)
            sscanf(line.c_str(), "MemAvailable: %ld kB", &available);
    }

    return ((float)(total - available) / total) * 100;
}

float getDiskUsage() {

    string output = executeCommand("df / | tail -1");

    long total, used, available;
    int percent;

    sscanf(output.c_str(),
           "%*s %ld %ld %ld %d%%",
           &total,
           &used,
           &available,
           &percent);

    return percent;
}

float getCPUUsage() {

    string output =
        executeCommand("top -bn1 | grep 'Cpu(s)' | awk '{print $2}'");

    try {
        return stof(output);
    }
    catch (...) {
        return 0;
    }
}

int main() {

    httplib::Server svr;

    svr.Get("/", [](const httplib::Request&, httplib::Response& res) {

        int cpu = (int)getCPUUsage();
        int ram = (int)getRAMUsage();
        int disk = (int)getDiskUsage();

        string html = R"(

<!DOCTYPE html>
<html>

<head>

<title>Real-Time System Monitor</title>

<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    padding: 30px;
}

h1 {
    text-align: center;
    color: #333;
}

.card {
    background: white;
    width: 70%;
    margin: 20px auto;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0px 2px 10px rgba(0,0,0,0.2);
}

.label {
    font-size: 22px;
    margin-bottom: 15px;
    font-weight: bold;
}

.bar-container {
    width: 100%;
    background-color: #ddd;
    border-radius: 20px;
    overflow: hidden;
}

.bar {
    height: 35px;
    line-height: 35px;
    color: white;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
}

.cpu {
    background-color: #4CAF50;
}

.ram {
    background-color: #2196F3;
}

.disk {
    background-color: #ff9800;
}

.footer {
    text-align: center;
    margin-top: 40px;
    color: #555;
}

</style>

</head>

<body>

<h1>🚀 Real-Time System Monitoring Dashboard</h1>

)";

        // CPU CARD
        html += "<div class='card'>";
        html += "<div class='label'>CPU Usage</div>";
        html += "<div class='bar-container'>";
        html += "<div class='bar cpu' style='width:" + to_string(cpu) + "%'>";
        html += to_string(cpu) + "%";
        html += "</div></div></div>";

        // RAM CARD
        html += "<div class='card'>";
        html += "<div class='label'>RAM Usage</div>";
        html += "<div class='bar-container'>";
        html += "<div class='bar ram' style='width:" + to_string(ram) + "%'>";
        html += to_string(ram) + "%";
        html += "</div></div></div>";

        // DISK CARD
        html += "<div class='card'>";
        html += "<div class='label'>Disk Usage</div>";
        html += "<div class='bar-container'>";
        html += "<div class='bar disk' style='width:" + to_string(disk) + "%'>";
        html += to_string(disk) + "%";
        html += "</div></div></div>";

        html += R"(

<div class="footer">
Real-Time Linux System Metrics using C++
</div>

</body>
</html>

)";

        res.set_content(html, "text/html");
    });

    svr.Get("/health", [](const httplib::Request&, httplib::Response& res) {

        res.set_content("OK", "text/plain");
    });

    cout << "Server running on http://localhost:9090" << endl;

    svr.listen("0.0.0.0", 9090);
}