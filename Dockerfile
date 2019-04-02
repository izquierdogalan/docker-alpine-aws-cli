FROM alpine:3.7

LABEL maintainer="Joe Bell<joe.bell.1329@gmail.com>"

RUN apk update

# Install base and dev packages
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash

# Install build packages
RUN apk add make && apk add curl && apk add openssh

# Install git
RUN apk add git

# Install nodejs
RUN apk add nodejs

# Install yarn
RUN apk add yarn

# Install docker
RUN apk add docker

# Install serverless
RUN npm install -g serverless
RUN npm install -g serverless-plugin-include-dependencies
RUN npm install -g serverless-plugin-optimize
RUN npm install -g serverless-offline
RUN npm install -g serverless-plugin-warmup

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install aws-cli
RUN apk -Uuv add groff less python py-pip curl
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

CMD ["/bin/bash"]
