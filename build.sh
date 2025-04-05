#!/usr/bin/env bash
set -o errexit

echo "🔧 Installing JDK 19..."

sudo apt-get update
sudo apt-get install -y wget gnupg software-properties-common

# Add JDK 19 repo
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/

# Install JDK 19
sudo apt-get update
sudo apt-get install -y adoptopenjdk-19-hotspot

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/adoptopenjdk-19-hotspot-amd64
export PATH=$JAVA_HOME/bin:$PATH

java -version

echo "📦 Installing Maven..."
sudo apt-get install -y maven

echo "🚀 Building your Spring Boot project..."
mvn clean package
