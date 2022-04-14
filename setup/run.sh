#!/bin/bash

set -e

if [ -z $1 ]; then
    echo Error, empty argument
    echo ./run.sh path/dockerfile
    exit
fi

scp -r ${HOME}/.ssh ssh_shared

DH_NAME="siewyanhoh"
FILE=$(basename $1)
NAME=$(basename -s .Dockerfile $1)

# build docker
echo docker build -f $FILE -t $DH_NAME/${NAME,,}:1.0 .
docker build -f $FILE -t $DH_NAME/${NAME,,}:1.0 .
rm -rf ssh_shared

# initalize container
echo docker run --privileged --name opendata --net=host --env="DISPLAY" -v $HOME/.Xauthority:/home/cmsusr/.Xauthority:rw -v /mnt/store1:/store1:rw -v /mnt/store2:/store2:rw -it $DH_NAME/${NAME,,}:1.0 /bin/bash
docker run --privileged --name opendata --net=host --env="DISPLAY" -v $HOME/.Xauthority:/home/cmsusr/.Xauthority:rw -v /mnt/store1:/store1:rw -v /mnt/store2:/store2:rw -it $DH_NAME/${NAME,,}:1.0 /bin/bash
