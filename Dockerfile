FROM alpine

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
 && pip3 install --upgrade \
 		pip \
		setuptools \
 && pip3 install \
 		'ansible==2.9.*' \
		netaddr \
		pbr \
		hvac \
		jmespath \
		ruamel.yaml \
 && apk del \
 		build-dependencies \
 && rm -rf /var/cache/apk/*

ENTRYPOINT [ "ansible-playbook" ]
