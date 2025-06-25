#!/bin/bash
SERVICE=$(cat "./conf/service")
ls -1 "./build/"; while IFS= read -r folder; do
	podman push "${SERVICE}_${folder}_latest" "${1}:${folder}"
done
exit