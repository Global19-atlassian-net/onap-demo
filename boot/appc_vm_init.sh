#!/bin/bash

NEXUS_USERNAME=$(cat /opt/config/nexus_username.txt)
NEXUS_PASSWD=$(cat /opt/config/nexus_password.txt)
export NEXUS_DOCKER_REPO=$(cat /opt/config/nexus_docker_repo.txt)
DMAAP_TOPIC=$(cat /opt/config/dmaap_topic.txt)
DOCKER_IMAGE_VERSION=$(cat /opt/config/docker_version.txt)

cd /opt/appc
git pull
cd /opt/appc/docker-compose

sed -i "s/DMAAP_TOPIC_ENV=.*/DMAAP_TOPIC_ENV="$DMAAP_TOPIC"/g" docker-compose.yml

docker login -u $NEXUS_USERNAME -p $NEXUS_PASSWD $NEXUS_DOCKER_REPO

docker pull $NEXUS_DOCKER_REPO/openecomp/appc-image:$DOCKER_IMAGE_VERSION
docker tag $NEXUS_DOCKER_REPO/openecomp/appc-image:$DOCKER_IMAGE_VERSION openecomp/appc-image:latest

docker pull $NEXUS_DOCKER_REPO/openecomp/dgbuilder-sdnc-image:$DOCKER_IMAGE_VERSION
docker tag $NEXUS_DOCKER_REPO/openecomp/dgbuilder-sdnc-image:$DOCKER_IMAGE_VERSION openecomp/dgbuilder-sdnc-image:latest

/opt/docker/docker-compose up -d
