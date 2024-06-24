# Use Node.js LTS (Long Term Support) version as the base image
FROM node:latest

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available) to work directory
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN npm run build

# Expose the port Next.js is running on (usually 3000)
EXPOSE 3000

# Command to run the Next.js application
CMD ["npm", "start"]

