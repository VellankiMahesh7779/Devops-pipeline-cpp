#include "httplib.h"

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <array>
#include <cstdio>

using namespace std;

string executeCommand(const char* cmd)
{
array<char, 128> buffer;
string result;

FILE* pipe = popen(cmd, "r");

if (!pipe)
    return "Error";

while (fgets(buffer.data(), 128, pipe) != nullptr)
{
    result += buffer.data();
}

pclose(pipe);

return result;

}

string readFile(const string& filename)
{
ifstream file(filename);

stringstream buffer;

buffer << file.rdbuf();

return buffer.str();

}

float getRAMUsage()
{
ifstream file("/proc/meminfo");

string line;

long total = 0;
long available = 0;

while (getline(file, line))
{
    if (line.find("MemTotal:") == 0)
        sscanf(line.c_str(), "MemTotal: %ld kB", &total);

    if (line.find("MemAvailable:") == 0)
        sscanf(line.c_str(), "MemAvailable: %ld kB", &available);
}

return ((float)(total - available) / total) * 100;

}

float getDiskUsage()
{
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

float getCPUUsage()
{
string output =
executeCommand("top -bn1 | grep 'Cpu(s)' | awk '{print $2}'");

try
{
    return stof(output);
}
catch (...)
{
    return 0;
}

}

int main()
{
httplib::Server svr;

svr.Get("/style.css",
        [](const httplib::Request&, httplib::Response& res)
        {
            string css = readFile("style.css");

            res.set_content(css, "text/css");
        });

svr.Get("/",
        [](const httplib::Request&, httplib::Response& res)
        {
            int cpu = (int)getCPUUsage();
            int ram = (int)getRAMUsage();
            int disk = (int)getDiskUsage();

            string html = readFile("index.html");

            size_t pos;

            while ((pos = html.find("CPU_PERCENT")) != string::npos)
            {
                html.replace(pos, 11, to_string(cpu));
            }

            while ((pos = html.find("RAM_PERCENT")) != string::npos)
            {
                html.replace(pos, 11, to_string(ram));
            }

            while ((pos = html.find("DISK_PERCENT")) != string::npos)
            {
                html.replace(pos, 12, to_string(disk));
            }

            res.set_content(html, "text/html");
        });

svr.Get("/health",
        [](const httplib::Request&, httplib::Response& res)
        {
            res.set_content("OK", "text/plain");
        });

cout << "Server running on http://localhost:9090" << endl;

svr.listen("0.0.0.0", 9090);

}
