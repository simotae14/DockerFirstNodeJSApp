# Specify a base image
FROM node:alpine

# define a Working directory
WORKDIR /usr/app

# Copy necessary files in my project
COPY ./package.json ./

# install some dependencies
RUN npm install

# Copy remaining files
COPY ./ ./

# default command
CMD ["npm", "start"]
