#!/bin/bash
rm -rf build
mkdir -p build
cp -Lr src/* build/
SERVICE=$(cat "./conf/service")
ls -1 build/ | while IFS= read -r folder; do
	echo "Entering \"${folder}\"..."
	cd "build/${folder}"
	podman build -t "${SERVICE}_${folder}_latest" .
	cd ../..
done
exit