# Sipeed builder containers

This repository contains the Dockerfiles for the Sipeed builder containers.

## Usage

The containers are published into the Docker Hub, so you can use them directly from there.

To build your project using the container, please run the following command:

```bash
docker run --rm -v <project-src-folder>:/data/code/<project-name> -v <project-out-folder>:/data/code/build_out -e PROJECT_NAME=<project-name> r12f/bl808-builder:latest
```