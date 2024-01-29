#!/bin/sh
set -eu

# Default param
IMAGE_NAME="tmp-friends/go-interpreter"
uid=1000
gid=1000
user=user

base=$(cd $(dirname $0); pwd)
echo $base
docker image build -t $IMAGE_NAME:latest -f $base/Dockerfile . \
  --build-arg uid=$uid \
  --build-arg gid=$gid \
  --build-arg user=$user
