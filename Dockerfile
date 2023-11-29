FROM debian:bullseye

RUN apt-get update && \
    apt-get -y install git curl python3-pip sudo libssl-dev && \
    apt-get clean && \
    git clone https://github.com/mhzawadi/ncpa.git /ncpa;

COPY start.sh /start.sh
COPY cloudsend.sh /cloudsend.sh

ENTRYPOINT ["/start.sh"]
