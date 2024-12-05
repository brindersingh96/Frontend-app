# Use a lightweight image with Nginx to serve the frontend
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy the frontend files to the Nginx server's directory
COPY index.html .
COPY style.css .
COPY script.js .

# Expose the port that Nginx will use
EXPOSE 8081

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
