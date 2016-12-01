#!/bin/sh

echo Creating backup image for $1;

echo Creating temp workspace /tmp/docker_backup;
mkdir /tmp/docker_backup;
cp $(pwd)/Dockerfile_mysql /tmp/docker_backup/Dockerfile;
cd /tmp/docker_backup;

echo Copying mysql data to temp workspace
docker cp $1:/var/lib/mysql $(pwd);
ls -al $(pwd);

echo Build docker image...
echo $(pwd);
docker build -t $1:$(date +%Y%m%d_%H%M) .;

cd -;

echo Clean up temp workspace;
rm -rf tmp/docker_backup;

