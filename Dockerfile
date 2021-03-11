FROM debian:buster

RUN git clone https://github.com/mhzawadi/ncpa.git /ncpa && \
    cd /ncpa/ && \
    echo 'y' | build/build.sh && \
    curl -X POST --data-binary @path/ncpa/build/*.deb https://owncloud.horwood.biz/s/9AptGgMwcHSHTdx;
