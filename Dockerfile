FROM ubuntu:22.04 AS download-image

RUN apt-get update && \
    apt-get install -y jq python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir gdown && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY download_samples.sh /
RUN chmod +x /download_samples.sh
