IMAGE=anskaffelser/ehfbuild

docker_build_single:
	@docker build -t anskaffelser/ehfbuild .

docker_build:
	@DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build \
		--platform=linux/amd64,linux/arm64 \
		--progress plain \
		--tag $(IMAGE):$(tag) \
		.

docker_push:
	@DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build \
		--platform=linux/amd64,linux/arm64 \
		--progress plain \
		--tag $(IMAGE):$(tag) \
		--push \
		.