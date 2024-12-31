.PHONY: default
default: create_keymap

# note, ${base_dir} is defined in the Makefiles that include this Makefile.in
cmd=.docker/run.sh

.PHONY: create_keymap
create_keymap:
	${cmd} "./keymap/create_keymap_by_layer.sh"
#${cmd} "keymap -c ./keymap/keymap_config_trans_orange.yaml parse -c 10 -z ./config/corne.keymap >./keymap/corne.yaml; keymap -c ./keymap/keymap_config_trans_orange.yaml draw ./keymap/corne.yaml -s numbers >./keymap/corne.svg; keymap -c ./keymap/keymap_config.yaml parse -c 10 -z ./config/corne.keymap >./keymap/corne_base.yaml; keymap -c ./keymap/keymap_config.yaml draw ./keymap/corne_base.yaml -s default >./keymap/corne_base.svg"


.PHONY: build
build:
	${cmd} "echo Welcome to Docker dude!"

#--------------------------------
# start/stop/restart docker
#--------------------------------
.PHONY: start
start:
	.docker/start.sh

.PHONY: stop
stop:
	.docker/stop.sh

.PHONY: restart
restart: stop start

#--------------------------------
# clean up and going into docker
#--------------------------------
.PHONY: into
into:
	${base_dir}/.docker/into.sh

