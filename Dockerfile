# Use an official Python base image
FROM python:3.11-slim

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy default nginx config (optional)
COPY nginx.conf /etc/nginx/nginx.conf

# Create a directory for your Python app
WORKDIR /app
COPY . /app

# Install Python dependencies (if any)
# RUN pip install -r requirements.txt

# Expose ports (e.g., 80 for Nginx, 5000 for Python app)
EXPOSE 80
EXPOSE 5000

# Start Nginx and your Python app (example using Flask with gunicorn)
CMD service nginx start && \
    gunicorn app:app --bind 0.0.0.0:5000
