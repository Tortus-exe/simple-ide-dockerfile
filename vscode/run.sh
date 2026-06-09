#!/bin/sh

docker run -d -p 8080:8080 -v $(pwd):/workspace vscode-docker