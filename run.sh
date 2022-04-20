#!/bin/bash

set -e

if [ -z $1 ]; then
    echo Error, empty argument
    echo ./run.sh path/dockerfile
    exit
fi

scp -r ${HOME}/.ssh ssh_shared
scp ${HOME}/.gitconfig gitconfig

if [ ! -f ./ssh_shared/config ];then
    touch ./ssh_shared/config
fi

DH_NAME="siewyanhoh"
FILE=$(basename $1)
NAME=$(basename -s .Dockerfile $1)
VERSION="1.0"

# build docker
echo docker build -f $FILE -t $DH_NAME/${NAME,,}:${VERSION} .
docker build -f $FILE -t $DH_NAME/${NAME,,}:${VERSION} .
rm -rf ssh_shared
rm -f gitconfig

# initalize container
echo docker run --privileged -p 5901:5901 -p 6080:6080 --name opendata --net=host --env="DISPLAY" -v $HOME/.Xauthority:/home/cmsusr/.Xauthority:rw -v /mnt/store1:/store1:rw -v /mnt/store2:/store2:rw -it $DH_NAME/${NAME,,}:${VERSION} /bin/bash
docker run --privileged -p 5901:5901 -p 6080:6080 --name opendata --net=host --env="DISPLAY" -v $HOME/.Xauthority:/home/cmsusr/.Xauthority:rw -v /mnt/store1:/store1:rw -v /mnt/store2:/store2:rw -it $DH_NAME/${NAME,,}:${VERSION} /bin/bash

#echo "alias cmsenv=\"docker start -i ${NAME}\"" >> $HOME/.bashrc
