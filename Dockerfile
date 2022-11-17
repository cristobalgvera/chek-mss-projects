######################
#### COMMON TASKS ####
######################

# Create a new Node 14 image
FROM node:14-alpine as base
# Set the working directory
WORKDIR /app
# Copy all files (can be copied just package.json and lock files too)
COPY . .

######################
###### BUILDER #######
######################

# Based on `base` image
FROM base as builder
RUN npm install
RUN npm run build

######################
#### DEVELOPMENT #####
######################

# Based on `base` image
FROM base as dev
CMD [ "npm", "run", "start:dev" ]

######################
######## QA ##########
######################

# Based on `builder` image
FROM builder as qa
CMD [ "node", "dist/main.js" ]

######################
#### PRODUCTION ######
######################

# Based on `builder` image
FROM builder as prod
CMD [ "node", "dist/main.js" ]
