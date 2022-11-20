# Create a new Node 14 image
FROM node:14-alpine as base
# Set the working directory
WORKDIR /app
# Copy the package.json file
COPY package*.json ./
# Install the dependencies
RUN npm install --silent
# Copy all files
COPY . .

FROM base as builder
RUN npm run build

FROM base as dev
CMD [ "npm", "run", "start:dev" ]

FROM builder as qa
CMD [ "node", "dist/main.js" ]

FROM builder as prod
CMD [ "node", "dist/main.js" ]
