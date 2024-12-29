.PHONY: default
default: create_keymap

# note, ${base_dir} is defined in the Makefiles that include this Makefile.in
cmd=.docker/run.sh

.PHONY: create_keymap
create_keymap:
	${cmd} "keymap parse -c 10 -z ./config/corne.keymap >./keymap/corne.yaml; keymap draw ./keymap/corne.yaml >./keymap/corne.ortho.svg"


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

