#!/bin/sh

cd /ncpa && \
echo 'y' | build/build.sh && \
/cloudsend.sh -k /ncpa/build/*.deb https://horwood.cloud/s/G58K8kzMNEwoSos
