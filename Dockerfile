# Specify a base image
FROM alpine

# install some dependencies
RUN npm install

# default command
CMD ["npm", "start"]
