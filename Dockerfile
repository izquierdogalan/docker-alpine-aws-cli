FROM node:12.4-alpine

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

# Install serverless for aws
RUN yarn global add serverless

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install aws-cli
RUN apk -Uuv add groff less python py-pip curl
RUN apk -v --update add \
        python \
        py-pip \
        yarn \
        groff \
        less \
        mailcap \
        && \
        pip install --upgrade pip awscli==1.14.5 s3cmd==2.0.1 python-magic
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

CMD ["/bin/bash"]

