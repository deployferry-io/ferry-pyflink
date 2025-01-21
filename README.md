# Ferry Pyflink Docker Image

This is a compiled ferry pyflink docker image. It runs on either Arm64 or AMD64

To build for both architectures:

```sh
docker buildx build --push --platform=linux/amd64,linux/arm64/v8 --tag public.ecr.aws/ferry-io/ferry-pyflink:latest .
```
