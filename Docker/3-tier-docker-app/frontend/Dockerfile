# Use Nginx as the frontend web server
FROM nginx:alpine

# Copy our frontend page
COPY index.html /usr/share/nginx/html/index.html

# Replace default Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Frontend listens on port 80
EXPOSE 80
