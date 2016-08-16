#/bin/bash
#build a simple flask application and push it to dockerhub

repodir=$1
dockerhub=$2

cd "$repodir"
git pull
docker build -t $dockerhub:latest .
docker push $dockerhub
