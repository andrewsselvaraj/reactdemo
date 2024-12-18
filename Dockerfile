# Use Node.js image as the base
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the React application
RUN npm run build

# Install 'serve' globally to serve the build folder
RUN npm install -g serve

# Expose the application on port 3000
EXPOSE 3000
#EXPOSE 3001

# Command to serve the build folder
CMD ["serve", "-s", "build", "-l", "3000"]

## sudo docker run -p 8080:8080 -t docker-spring-boot:1.0
## sudo docker run -p 80:8080 -t docker-spring-boot:1.0
## sudo docker run -p 443:8443 -t docker-spring-boot:1.0
## docker run -p 4000:3000 andrewsselvaraj/reactdemo

