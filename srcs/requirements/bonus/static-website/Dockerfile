# syntax=docker/dockerfile:1
FROM debian:bullseye

# Update and upgrade the system packages
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y \
	nodejs \
	npm

# Create a directory for the application
RUN mkdir -p /usr/src/app

# Set the working directory to the application directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files to the working directory
COPY conf/package*.json ./

# Install the dependencies specified in the package.json file
RUN npm install

# Create directories for public and source files
RUN mkdir public/ src/

# Copy the public files to the public directory
COPY conf/public/* public/

# Copy the source files to the src directory
COPY conf/src/* src/
	
# Start the application using the "npm start" command
CMD [ "npm", "start" ]
