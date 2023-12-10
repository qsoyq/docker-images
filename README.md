# docker-images

## 使用docker buildx 同时构建并推送多架构镜像

```bash
docker buildx create --use --platform=linux/arm64/v8,linux/amd64 --name multi-platform-builder
docker buildx inspect --bootstrap
docker buildx build --platform=linux/arm64,linux/amd64 --push --tag qsoyq/python-tox-testenv:latest -f ./docker/python-tox-testenv .
```

docker buildx create 创建了builder.

docker buildx inspect --bootstrap 执行创建后的初始化.

docker buildx build 负责构建并推送镜像.

前两者仅需执行一次.
