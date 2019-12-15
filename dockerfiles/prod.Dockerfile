# Install Node.js v8.x
FROM node:carbon-alpine
MAINTAINER Fulkman

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

# Update/Upgrade OS
RUN apk update && \

# For native dependencies, you'll need extra tools
apk add --no-cache make gcc g++ python && \

# For compile npm module
npm install -g node-gyp && \

# Install app dependencies
npm install --production && \

# Cleanup
npm uninstall -g node-gyp && \
apk del make gcc g++ python && \
rm -rf ~/.cache

ENV DEBUG pietrum:*
ENV NODE_ENV production

CMD [ "npm", "start" ]
