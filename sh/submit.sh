#!/bin/bash
SERVICE=$(cat "./conf/service")
echo "Container image submission has started."
ls -1 "./build/" | while IFS= read -r folder; do
	imageName="${SERVICE}_${folder}_latest"
	echo "Publishing \"${folder}\" from \"${imageName}\"..."
	podman push "${imageName}" "${1}:${folder}"
done
exit