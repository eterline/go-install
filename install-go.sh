#! /bin/sh

GO_TAR_NAME=go1.23.5.linux-amd64.tar.gz
GO_REPO_TAR="https://dl.google.com/go/${GO_TAR_NAME}"

PATH_UPDATE_STR="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/go/bin"

echo getting go from repo
curl -O ${GO_REPO_TAR}

echo extract go to: "/usr/local/"
tar -xzf ${GO_TAR_NAME} -C /usr/local/

echo env updated. reboot host
echo PATH=${PATH_UPDATE_STR} > /etc/environment

echo after reboot write 'go' for check
