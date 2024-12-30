#!/bin/bash

source $(dirname "${BASH_SOURCE[0]}")/config.sh

if ! [[ $(docker ps | grep ${name}) ]]
then
    docker run -d --rm --name $name \
        --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume /var/run/docker.sock:/var/run/docker.sock \
        --user $(id -u) \
        --net=host \
        --env="DISPLAY" \
        -v $abs_root_dir:$abs_root_dir \
        -w $(pwd) \
        $dockername /bin/bash -c "touch /tmp/docker_started; sleep infinity"
else
    echo "[INFO] Docker was already started. If you want to restart call 'make restart'"
fi
