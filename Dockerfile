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
EXPOSE 3001

# Command to serve the build folder
CMD ["serve", "-s", "build", "-l", "3000"]