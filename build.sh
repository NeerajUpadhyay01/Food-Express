#!/usr/bin/env bash
set -o errexit

echo "📦 Using pre-installed Java 17..."

# Set JAVA_HOME to Java 17 (preinstalled on Render)
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

java -version

echo "🚀 Installing Maven..."
apt-get update
apt-get install -y maven

echo "🏗️ Building the app..."
mvn clean package -DskipTests
