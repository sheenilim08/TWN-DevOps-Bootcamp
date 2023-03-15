#!/bin/bash

echo "Downloading Node 18.15.0 LTS"
wget https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.xz

echo "Extracting Node Compressed File"
jar -xvf node-v18.15.0-linux-x64.tar.xz

echo "Add Node Path"
PATH=$PATH:~/node-v18.15.0-linux-x64/bin

echo "Check Node and NPM versions"
npm --version
node --version

echo "Downloading Artifact File"
wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz

echo "Extracting Artfifact"
jar -xvf bootcamp-node-envvars-project-1.0.0.tgz

echo "Setting ENV values"
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package

echo "Installing packages"
npm install

echo "running server"
node server.js