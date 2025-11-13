#!/bin/bash
# Script to install Apache (httpd) and deploy a test HTML page on Amazon Linux 2

# Update system packages
sudo yum update -y

# Install Apache (httpd)
sudo yum install -y httpd

# Enable and start Apache service
sudo systemctl enable httpd
sudo systemctl start httpd

# Create a simple test HTML page
echo "<html>
  <head><title>Test Page</title></head>
  <body>
    <h1>Hello from Apache on Amazon Linux!</h1>
    <p>This is a test HTML page served by Apache (httpd).</p>
  </body>
</html>" | sudo tee /var/www/html/index.html

# Adjust permissions
sudo chmod 644 /var/www/html/index.html

echo "✅ Apache installation complete. Visit http://<your-server-ip>/ to see the test page."
