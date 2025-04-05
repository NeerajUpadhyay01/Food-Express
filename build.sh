#!/usr/bin/env bash
set -o errexit

echo "📦 Installing SDKMAN (Java version manager)..."

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install Java 17
sdk install java 17.0.9-tem

# Set JAVA_HOME automatically
sdk use java 17.0.9-tem
java -version

# Install Maven
sdk install maven
mvn -version

echo "🏗️ Building the app..."
mvn clean package -DskipTests
