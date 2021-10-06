# Specify a base image
FROM node:12-alpine

# Copy necessary files in my project
COPY ./ ./

# install some dependencies
RUN npm install

# default command
CMD ["npm", "start"]
