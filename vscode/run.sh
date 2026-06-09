#!/bin/sh

docker run -d -p 8080:8080 -v $1:/home/ubuntu/contents -v $(pwd):/workspace vscode-docker