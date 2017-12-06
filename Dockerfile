FROM ubuntu:16.04
MAINTAINER frappé

USER root
RUN apt-get update && apt-get install -y iputils-ping git build-essential python-setuptools python-dev libffi-dev libssl-dev redis-tools software-properties-common libxrender1 libxext6 xfonts-75dpi xfonts-base libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev python-tk apt-transport-https libsasl2-dev libldap2-dev libtiff5-dev tcl8.6-dev tk8.6-dev wget curl rlwrap redis-tools nano vim sudo wkhtmltopdf libmysqlclient-dev mariadb-client mariadb-common python-pip supervisor && \
    pip install --upgrade setuptools pip && \
    useradd -ms /bin/bash frappe && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs

USER frappe
RUN git clone -b develop https://github.com/frappe/bench.git /home/frappe/bench-repo && \
    pip install --user -e /home/frappe/bench-repo

ENV PATH $PATH:/home/frappe/.local/bin
WORKDIR /home/frappe/frappe-bench
