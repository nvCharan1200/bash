#!/bin/bash

# Exit on any error
set -e

# Variables
TOMCAT_VERSION=9.0.85
TOMCAT_USER=tomcat
INSTALL_DIR=/opt/tomcat
TOMCAT_TAR=apache-tomcat-$TOMCAT_VERSION.tar.gz
TOMCAT_URL=https://downloads.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/$TOMCAT_TAR

echo "🔧 Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "☕ Installing OpenJDK 11..."
sudo apt install openjdk-11-jdk -y

echo "👤 Creating Tomcat user..."
sudo useradd -m -U -d $INSTALL_DIR -s /bin/false $TOMCAT_USER || true

echo "📦 Downloading Apache Tomcat $TOMCAT_VERSION..."
wget $TOMCAT_URL -P /tmp

echo "📂 Extracting Tomcat..."
sudo mkdir -p $INSTALL_DIR
sudo tar -xzf /tmp/$TOMCAT_TAR -C $INSTALL_DIR --strip-components=1

echo "🔒 Setting permissions..."
sudo chown -R $TOMCAT_USER:$TOMCAT_USER $INSTALL_DIR
sudo chmod +x $INSTALL_DIR/bin/*.sh

echo "🚀 Starting Tomcat..."
sudo -u $TOMCAT_USER $INSTALL_DIR/bin/startup.sh

echo "✅ Tomcat installed and started successfully!"
echo "🌐 Access it via: http://<your-server-ip>:8080"
