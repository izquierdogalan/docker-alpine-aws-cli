FROM node:carbon-alpine

LABEL maintainer="Dapda<info@dapda.com>"

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
RUN yarn global add serverless
RUN yarn global add serverless-plugin-include-dependencies
RUN yarn global add serverless-offline
RUN yarn global add serverless-plugin-warmup
RUN yarn global add @grpc/grpc-js
RUN yarn global add serverless-plugin-optimize

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install aws-cli
RUN apk -Uuv add groff less python py-pip curl
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

CMD ["/bin/bash"]

