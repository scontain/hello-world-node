#!/bin/bash
echo "Pulling precompiled node14 binary"
docker pull registry.scontain.com:5050/sconecuratedimages/node:14.4.0-alpine3.11
docker run -it --rm \
            -v /var/run/docker.sock:/var/run/docker.sock \
            registry.scontain.com:5050/sconecuratedimages/iexec-sconify-image:5.3.3 sconify_iexec \
            --name=helloworldNode14 \
            --from=registry.scontain.com:5050/sconecuratedimages/iexecsgx:hello-world-node14 \
            --to=hello-world-node14-scone \
            --binary-fs \
            --fs-dir=/app \
            --binary="/usr/local/bin/node" \
            --heap="256m" \
            --dlopen="2" \
            --no-color \
            --verbose \
            --command="node /app/main.js"
