FROM node:16.14.2

WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Configure npm to ignore SSL certificate errors (for development purposes)
RUN npm config set strict-ssl false

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]