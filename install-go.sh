#! /bin/sh

GO_TAR_NAME=go1.23.5.linux-amd64.tar.gz
GO_REPO_TAR="https://github.com/eterline/go-install/${GO_TAR_NAME}"

PATH_UPDATE_STR="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/go/bin"

echo getting go from repo
curl -O ${GO_REPO_TAR}

echo extract go to: "/usr/local/"
tar -xzf ${GO_TAR_NAME} -C /usr/local/

printf "Rewrite go bin to PATH in: '/etc/environment' (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo PATH=${PATH_UPDATE_STR} > /etc/environment
    echo env updated. reboot host
else
    echo bye
fi

echo after reboot write 'go' for check
