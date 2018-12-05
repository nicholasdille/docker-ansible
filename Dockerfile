FROM alpine:3.8

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
 && pip install --upgrade pip setuptools \
 && pip install ansible \
 && apk del build-dependencies \
 && rm -rf /var/cache/apk/* \
 && mkdir /src

VOLUME /src
WORKDIR /src

ENTRYPOINT [ "ansible-playbook" ]
