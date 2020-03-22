.PHONY: all run-docker

# Try to retrieve the IoT-LAB login from the host setup
IOTLAB_AUTH ?= $(HOME)/.iotlabrc
IOTLAB_LOGIN ?= $(shell cut -f1 -d: $(IOTLAB_AUTH))

all:
	@echo
	@echo "Use 'make run-docker' to start the Jupyterlab session in Docker"
	@echo

run-docker:
	docker run --rm -it \
		-e IOTLAB_LOGIN=$(IOTLAB_LOGIN) \
		-e USER_ID=$$(id -u $(USER)) \
		-v $(PWD):/shared \
		-p 8888:8888 \
		aabadie/iot-lab-training