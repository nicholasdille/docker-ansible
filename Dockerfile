FROM alpine:3.14

RUN apk update\
 && apk add --virtual build-dependencies \
		gcc \
		musl-dev \
		libffi-dev \
		openssl-dev \
		python3-dev \
 && apk add \
		bash \
		curl \
		tar \
		openssh-client \
		sshpass \
		git \
		python3 \
		py3-boto \
		py3-dateutil \
		py3-httplib2 \
		py3-jinja2 \
		py3-paramiko \
		py3-pip \
		py3-yaml \
		ca-certificates \
		patch \
 && pip3 install --upgrade \
 		pip \
		setuptools \
 && pip3 install \
 		ansible \
		netaddr \
		pbr \
		hvac \
		jmespath \
		ruamel.yaml \
 && apk del \
 		build-dependencies \
 && rm -rf /var/cache/apk/*

ENTRYPOINT [ "ansible-playbook" ]
