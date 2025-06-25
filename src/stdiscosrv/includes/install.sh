#!/bin/ash
unameArch=$(uname -m)
transArch=$unameArch
case $unameArch in
	"x86_64" | "amd64")
		transArch=amd64
		;;
	"arm64" | "armv8l" | "aarch64")
		transArch="arm64"
		;;
esac
mkdir -p /opt/stdiscosrv
cd /opt/stdiscosrv
wget -O - "https://github.com/syncthing/discosrv/releases/download/v1.29.6/stdiscosrv-linux-${transArch}-v1.29.6.tar.gz" | tar zxvf -
mv stdiscosrv-linux-*/* ./
rmdir -v stdiscosrv-linux-*
ln -s /opt/stdiscosrv/stdiscosrv /bin/
mkdir -p /data
exit