
FROM debian:bookworm-slim
RUN apt update && \
    apt install wget unzip -y && \
    apt clean && \
    wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    mv jq-linux64 jq && \
    chmod +x jq && \
    wget https://aka.ms/downloadazcopy-v10-linux \
        --output-document=azcopy.tar && \
    tar -xf azcopy.tar && \
    mv azcopy*/azcopy / && \
    chmod +x /azcopy && \
    wget https://github.com/countercept/chainsaw/releases/download/v1.1.5/chainsaw_x86_64-unknown-linux-gnu.tar.gz && \
    tar -xzf chainsaw*.tar.gz && \
    rm -v *.tar *.tar.gz

COPY --chmod=777 ./scripts/* /scripts/

WORKDIR /chainsaw

CMD ["/bin/sh", "/scripts/start.sh"]
