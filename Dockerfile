FROM alpine

RUN apk update\
 && apk add --virtual build-dependencies \
		gcc \
		musl-dev \
		libffi-dev \
		openssl-dev \
		python-dev \
 && apk add \
		bash \
		curl \
		tar \
		openssh-client \
		sshpass \
		git \
		python \
		py-boto \
		py-dateutil \
		py-httplib2 \
		py-jinja2 \
		py-paramiko \
		py-pip \
		py-yaml \
		ca-certificates \
 && pip install --upgrade \
 		pip \
		setuptools \
 && pip install \
 		'ansible>=2.7,<2.8' \
		netaddr \
		pbr \
		hvac \
		jmespath \
		ruamel.yaml \
 && apk del \
 		build-dependencies \
 && rm -rf /var/cache/apk/*

ENTRYPOINT [ "ansible-playbook" ]
