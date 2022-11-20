# Create a new Node 14 image
FROM node:14-alpine
# Set the working directory
WORKDIR /app
# Copy the package.json file
COPY package*.json ./
# Install the dependencies
RUN npm install --silent
# Copy all files
COPY . .
# Serve the app
CMD [ "npm", "run", "start:dev" ]
