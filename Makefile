DOCKER := /usr/bin/docker
TIMESTAMP := $(shell date -u +"%Y%m%d%H%M")
COMMIT := $(shell git rev-parse --short HEAD 2>/dev/null)
ifeq ($(shell uname),Darwin)
SELINUX1 :=
SELINUX2 :=
else
SELINUX1 := :z
SELINUX2 := ,z
endif

.PHONY: all left clean_firmware clean_image clean

all:
	sudo rm -f firmware/*.uf2
	$(shell bin/get_version.sh >> /dev/null)
	$(DOCKER) build --network=host --tag zmk --file Dockerfile .
	$(DOCKER) run --rm -it --name zmk \
	    --cpuset-cpus 0-3 \
		-v $(PWD)/firmware:/app/firmware$(SELINUX1) \
		-v $(PWD)/config:/app/config:ro$(SELINUX2) \
		-e TIMESTAMP=$(TIMESTAMP) \
		-e COMMIT=$(COMMIT) \
		-e BUILD_RIGHT=true \
		zmk
	git checkout config/version.dtsi

left:
	git pull
	$(shell bin/get_version.sh >> /dev/null)
	$(DOCKER) build --network=host --tag zmk --file Dockerfile .
	$(DOCKER) run --rm -it --name zmk \
		--cpuset-cpus 0-3 \
		-v $(PWD)/firmware:/app/firmware$(SELINUX1) \
		-v $(PWD)/config:/app/config:ro$(SELINUX2) \
		-e TIMESTAMP=$(TIMESTAMP) \
		-e COMMIT=$(COMMIT) \
		-e BUILD_RIGHT=false \
		zmk
	git checkout config/version.dtsi

clean_firmware:
	rm -f firmware/*.uf2

clean_image:
	$(DOCKER) image rm zmk docker.io/zmkfirmware/zmk-build-arm:stable

clean: clean_firmware clean_image
