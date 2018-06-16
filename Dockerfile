FROM arm64v8/ubuntu

ARG URL
WORKDIR /mnt/bazel

RUN apt-get update && \
    apt-get install -y build-essential openjdk-8-jdk python zip unzip curl

RUN curl -fsSL ${URL} > bazel.zip && \
    unzip -q bazel.zip && \
    bash ./compile.sh && \
    cp output/bazel /usr/local/bin/bazel

# Clean up
WORKDIR /mnt
RUN rm -rf bazel && bazel --help
