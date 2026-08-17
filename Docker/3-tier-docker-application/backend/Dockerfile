# Use Python as the base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy dependency file first
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Document the Flask application port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
