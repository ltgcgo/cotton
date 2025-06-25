#!/bin/bash
SERVICE="cider"
if [ -d "./build/${1}/" ] ; then
	cd ./build/${1}
	podman build -t ${SERVICE}_${1}_latest .
	podman push ${SERVICE}_${1}_latest docker://${REGISTRY}/${REG_USER}/${SERVICE}:${1}
	podman rmi ${SERVICE}_${1}_latest
else
	echo "Image \"${1}\" not found."
fi
exit