FROM ubuntu:22.04 AS download-image

RUN apt-get update && \
    apt-get install -y jq python3-pip

RUN pip3 install gdown
