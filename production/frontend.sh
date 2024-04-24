
# Save the script to a file named "setup_frontend.sh"
cat << 'EOF' > frontend.sh
#!/bin/bash
echo 'Adding frontend.sh...'
cat > /tmp/frontend.sh << 'EOL'
#!/bin/bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker CE
sudo apt-get install -y docker-ce

# Add the ubuntu user to the docker group
sudo usermod -aG docker ubuntu
# Docker login
sudo docker login -u alonageorge25219 -p Jeal@1908
# Run a Docker container
sudo docker run -d --name my-container -p 80:80 alonageorge25219/frontend:1.0.1
EOL
chmod +x /tmp/frontend.sh
/tmp/frontend.sh
EOF

# Make the script executable
chmod +x frontend.sh

# Execute the script
./frontend.sh
