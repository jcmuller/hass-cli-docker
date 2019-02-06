NAME:=$(shell basename `pwd`)
NOCACHE?=false
REGISTRY?=jcmuller
GIT_COMMIT?=$(shell git rev-parse HEAD)

all: build

.PHONY: build
build: Dockerfile
	docker build \
		--no-cache=$(NOCACHE) \
		-t $(REGISTRY)/$(NAME) \
		.

.PHONY: tag
tag: build
	docker tag $(REGISTRY)/$(NAME) $(REGISTRY)/$(NAME):$(GIT_COMMIT)

.PHONY: push
push: tag
	docker push $(REGISTRY)/$(NAME):latest
	docker push $(REGISTRY)/$(NAME):$(GIT_COMMIT)
