### Basic operation to run a Nodejs with Docker

## Define the Node app

Create a `index.js` file and a `package.json` file

<b>index.js</b>
```javascript
const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Hi there');
});

app.listen(8080, () => {
  console.log('Listening on port 8080');
});
```

<b>package.json</b>
```json
{
  "dependencies": {
    "express": "*"
  },
  "scripts": {
    "start": "node index.js"
  }
}
```

## Create a Dockerfile
like this one
```
# Specify a base image
FROM node:12-alpine

# Copy necessary files in my project
COPY ./ ./

# install some dependencies
RUN npm install

# default command
CMD ["npm", "start"]
```

if you want to use a node version >= 15 use this Dockerfile
```
# Specify a base image
FROM node:alpine

#Install some dependencies

WORKDIR /usr/app
COPY ./ /usr/app
RUN npm install

# Set up a default command
CMD [ "npm","start" ]
```

## Build the Docker Image
with the command
```
docker build -t startae14/simpleweb .
```

## Run the Docker Image
with the command
```
docker run -p 8080:8080 startae14/simpleweb
```
as you can see we are doing port forwarding

## Create a Working Directory
To avoid overwriting problems we can create a directory to nest all the files related
to the Node app
```
# Specify a base image
FROM node:alpine

# define a Working directory
WORKDIR /usr/app

# Copy necessary files in my project
COPY ./ ./

# install some dependencies
RUN npm install

# default command
CMD ["npm", "start"]
```

## How to minimize the Rebuild actions if we modify some files in the node app
We can just copy firstly the package.json file, then execute `npm install` and lastly copy the remaing files
```
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
```