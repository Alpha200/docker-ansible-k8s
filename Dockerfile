FROM alpha200/ansible

ARG VERSION=3.2.3

ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${VERSION}-linux-amd64.tar.gz"

RUN apk add --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} | tar xz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl && \
    rm -rf /var/cache/apk/*

RUN apk add --no-cache py3-pip && \
    pip3 install openshift
