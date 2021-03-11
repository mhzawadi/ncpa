FROM debian:buster

RUN apt-get update && \
    apt-get -y install git curl && \
    git clone https://github.com/mhzawadi/ncpa.git /ncpa;

COPY start.sh /start.sh
COPY cloudsend.sh /cloudsend.sh

ENTRYPOINT ["/start.sh"]
