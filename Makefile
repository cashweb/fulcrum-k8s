PROJECT := schancel/
IMAGE_NAME := fulcrum
VERSION := $(shell git rev-list --count HEAD)-$(shell git rev-parse --short HEAD)

.PHONY: image push

image:
	docker build --no-cache . -t $(PROJECT)$(IMAGE_NAME):latest
	docker tag $(PROJECT)$(IMAGE_NAME):latest $(PROJECT)$(IMAGE_NAME):$(VERSION)

push: image
	docker push $(PROJECT)$(IMAGE_NAME):$(VERSION)
	docker push $(PROJECT)$(IMAGE_NAME):latest
