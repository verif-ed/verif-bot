#!/bin/bash

# Exit script on any error
set -e

# Update package list and install dependencies
echo "Updating package list and installing dependencies..."
sudo apt-get update && sudo apt-get install -y python3-pip python3-venv

# Create and activate virtual environment
echo "Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Upgrade pip and install Rasa
echo "Upgrading pip and installing Rasa..."
pip install --upgrade pip
pip install rasa

# Train the Rasa model
echo "Training the Rasa model..."
rasa train

echo "Build completed successfully."
