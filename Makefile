.PHONY: default build notify tox_build_with_push tox_build_amd64_with_push tox_build_arm64_with_push

default: tox_build_arm64_with_push

# Apple M1 构建 linux/amd64 镜像编译速度很慢, 本机仅构建linux/arm64/v8
tox_build_arm64_with_push:	
	docker buildx build --platform=linux/arm64/v8 --push --tag qsoyq/python-tox-testenv:arm64 -f ./docker/python/python-tox-testenv .
	make notify

notify:
	if [ -n ${BARK_TOKEN} ]; then curl https://api.day.app/$(BARK_TOKEN)/images%20makefile%20run%20success; fi;
