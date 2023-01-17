# Set the base image to Node 17.1.0-alpine
FROM node:17.1.0-alpine

# Set the working directory for all subsequent commands
WORKDIR /app/storefront

# Copy the package.json and yarn lock files to the working directory
COPY package.json .
COPY yarn.* .

# Run the apk update command to update package information and then install the dependencies listed in the yarn lock file
RUN apk update && yarn

# Copy all files in the current directory (.) to the working directory in the container
COPY . .

# Set the default command to run the application in development mode
ENTRYPOINT [ "yarn", "dev"]