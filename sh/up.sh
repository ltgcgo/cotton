#!/bin/bash
if [ -e "src/${1}" ]; then
	rm -rf "build/${1}"
	mkdir -p "build/${1}"
	cp -Lr "src/${1}" "build/"
	SERVICE=$(cat "./conf/service")
	NAME_PREFIX="${1}_${SERVICE}"
	cd "build/${1}"
	pwd
	tree
	podman stop "${NAME_PREFIX}_1"
	podman container rm "${NAME_PREFIX}_1"
	podman rmi "${NAME_PREFIX}"
	all_proxy= HTTPS_PROXY= ALL_PROXY= https_proxy= HTTP_PROXY= http_proxy= NO_PROXY= no_proxy= ftp_proxy= FTP_PROXY= podman-compose up -d
else
	echo "Folder \"${1}\" is not found."
fi