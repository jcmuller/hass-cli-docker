NAME:=$(shell basename `pwd`)
DEV_NAME:=$(NAME)-dev
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

.PHONY: build-dev
build-dev: Dockerfile.dev
	docker build \
		--no-cache=$(NOCACHE) \
		-t $(REGISTRY)/$(DEV_NAME) \
		-f $^ \
		.

.PHONY: tag-dev
tag-dev: build-dev
	docker tag $(REGISTRY)/$(DEV_NAME) $(REGISTRY)/$(DEV_NAME):$(GIT_COMMIT)

.PHONY: push-dev
push-dev: tag-dev
	docker push $(REGISTRY)/$(DEV_NAME):latest
	docker push $(REGISTRY)/$(DEV_NAME):$(GIT_COMMIT)
