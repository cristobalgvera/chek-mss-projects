# Create a new Node image
FROM node:18 as dev

# Set the working directory
WORKDIR /app

# Copy the package.json file
COPY package*.json ./

# Install the dependencies
RUN npm install -g @nestjs/cli
RUN npm install --silent

# Copy all files
COPY . .

# Serve the app
CMD [ "npm", "run", "start:debug" ]
