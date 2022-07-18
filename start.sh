#!/bin/sh

cd /ncpa && \
echo 'y' | build/build.sh && \
/cloudsend.sh -k /ncpa/build/*.deb https://owncloud.horwood.biz/s/9AptGgMwcHSHTdx
