FROM ubuntu:22.04 AS download-image

RUN apt-get update && \
    apt-get install -y jq python3

RUN pip install gdown
