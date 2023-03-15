#!/bin/bash

echo "Downloading Node 18.15.0 LTS"
wget https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.xz > /dev/null 2>&1

echo "Extracting Node Compressed File"
tar -xvf node-v18.15.0-linux-x64.tar.xz > /dev/null 2>&1

echo "Add Node Path"
PATH=$PATH:~/node-v18.15.0-linux-x64/bin

echo "Check Node and NPM versions"
echo "NPM version $(npm --version)"
echo "Node version $(node --version)"

echo "Downloading Artifact File"
wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz > /dev/null 2>&1

echo "Extracting Artfifact"
tar -xvf bootcamp-node-envvars-project-1.0.0.tgz > /dev/null 2>&1

echo "Setting ENV values"
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package

echo "Installing packages"
npm install > /dev/null 2>&1

echo "running server on background"
node server.js & > /dev/null 2>&1
sleep 1 # must wait one second so that the node server can full load server.js, if skipped, port_num might be interpreted before the node can open the port.

process_id=$(ps -u $USER | grep "node" | awk '{print $1}')
port_num=$(netstat -aonp 2> /dev/null | grep "$process_id" | awk '{print $4}' | tr -d ':')
echo "Node Process $process_id listening on $port_num."