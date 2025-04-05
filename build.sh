#!/usr/bin/env bash
set -o errexit

echo "🔧 Installing JDK 19..."

sudo apt-get update
sudo apt-get install -y wget gnupg software-properties-common

# Add Azul Zulu JDK repo (for JDK 19)
wget -qO - https://repos.azul.com/azul-repo.key | sudo apt-key add -
sudo apt-add-repository 'deb http://repos.azul.com/zulurepo stable main'

# Install JDK 19
sudo apt-get update
sudo apt-get install -y zulu19-jdk

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/zulu19
export PATH=$JAVA_HOME/bin:$PATH

echo "✅ Java version:"
java -version

echo "📦 Installing Maven..."
sudo apt-get install -y maven

echo "🚀 Building your Spring Boot project..."
mvn clean package -DskipTests
