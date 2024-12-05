# Use a lightweight Nginx image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the frontend files into the Nginx directory
COPY index.html ./
COPY style.css ./
COPY script.js ./

# Expose port 8081, which is where Nginx will serve the app
EXPOSE 8081

# Copy your custom Nginx configuration file into the container
# Ensure the nginx.conf file is in the same directory as this Dockerfile
COPY nginx.conf /etc/nginx/nginx.conf

# Run Nginx in the foreground (daemon off)
CMD ["nginx", "-g", "daemon off;"]
