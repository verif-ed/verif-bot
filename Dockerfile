# Use the official Python 3.10 image from the Docker Hub
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Update and install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Rasa dependencies
RUN pip install --upgrade pip
RUN pip install rasa

# Expose port 5005 for Rasa server
EXPOSE 5005

# Command to run the Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*"]
