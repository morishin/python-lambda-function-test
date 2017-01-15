FROM amazonlinux:latest

RUN yum -y update && yum -y install gcc python27-devel
RUN cd /tmp && \
    curl https://bootstrap.pypa.io/get-pip.py | python2.7 - && \
    pip install virtualenv
WORKDIR /app
CMD virtualenv -p python2.7 venv-for-deployment && \
    source venv-for-deployment/bin/activate && \
    pip install -r requirements.txt
