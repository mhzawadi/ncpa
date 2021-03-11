FROM debian:buster

RUN apt-get update && \
    apt-get -y install git curl && \
    git clone https://github.com/mhzawadi/ncpa.git /ncpa && \
    wget -O /cloudsend.sh 'https://raw.githubusercontent.com/tavinus/cloudsend.sh/master/cloudsend.sh' && chmod +x cloudsend.sh;

COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]
