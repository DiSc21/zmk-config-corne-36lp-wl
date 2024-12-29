#!/bin/bash

source $(dirname "${BASH_SOURCE[0]}")/config.sh

if ! [[ $(docker ps | grep ${name}) ]]
then
    source $(dirname "${BASH_SOURCE[0]}")/build.sh
    docker run -i --rm --name ${name} \
        --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume /var/run/docker.sock:/var/run/docker.sock \
        --user $(id -u) \
        --net=host \
        --env="DISPLAY" \
        -v $abs_root_dir:$abs_root_dir \
        -w $(pwd) \
        $dockername /bin/bash -c "$@"
else
    docker exec -i ${name} /bin/bash -c "cd $(pwd); $@"
fi
