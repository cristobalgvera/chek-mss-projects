# Create a new Node 14 image
FROM node:14-alpine as base
# Set the working directory
WORKDIR /app

FROM base as dev
COPY . .
CMD [ "npm", "run", "start:dev" ]

FROM base as builder
# Copy the package.json file
COPY package*.json ./
# Install the dependencies
RUN npm install --silent
# Copy all files
COPY . .
# Build the app
RUN npm run build

FROM builder as qa
CMD [ "node", "dist/main.js" ]

FROM builder as prod
CMD [ "node", "dist/main.js" ]
