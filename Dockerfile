# Base image
FROM ubuntu:22.04

# Install compiler
RUN apt-get update && \
    apt-get install -y g++

# Set working directory
WORKDIR /app

# Copy source files
COPY app/src/ .

# Compile application
RUN g++ server.cpp -o server -pthread

# Expose application port
EXPOSE 9090

# Run application
CMD ["./server"]
