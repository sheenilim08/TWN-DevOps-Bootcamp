#!/bin/bash

echo "Downloading Json Output"
curl -u npmmaven-user:@dm1n@local.net -X GET 'http://192.168.1.249:8081/service/rest/v1/components?repository=NPM-HOSTED&sort=version' | jq "." > artifact.json

artifactDownloadUrl=$(jq '.items[].assets[].downloadUrl' artifact.json --raw-output)

echo "Downloading Artifact File"
wget --http-user=npmmaven-user --http-password=@dm1n@local.net $artifactDownloadUrl

filename="${artifactDownloadUrl##*/}"
tar -xvf "./$filename"

echo "Updating PATH"
PATH=$PATH:/home/sheenlim08/node-v18.13.0-linux-x64/bin

cd package
echo "Installing NPM modules"
npm install

node server.js