#include "httplib.h"
#include <iostream>

int main() {
    httplib::Server svr;

    // Route 1: Home
    svr.Get("/", [](const httplib::Request&, httplib::Response& res) {
        res.set_content("Hello I am MaheshVellanki from DevOps C++ Server!", "text/plain");
    });

    // Route 2: Health check
    svr.Get("/health", [](const httplib::Request&, httplib::Response& res) {
        res.set_content("MaheshVellanki healthy is Okay!", "text/plain");
    });

    std::cout << "Server running on http://localhost:9090" << std::endl;

    svr.listen("0.0.0.0", 9090);
}
