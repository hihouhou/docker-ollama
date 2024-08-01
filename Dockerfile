#
# Ollama server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV OLLAMA_VERSION v0.3.2

# Update & install packages for Ollama
RUN apt-get update && \
    apt-get install -y netcat wget curl gnupg ca-certificates lsb-release

RUN useradd -ms /bin/bash ollama

RUN mkdir -p /home/ollama && \
    usermod -u 1000 ollama

#Get steamcmd
RUN wget -qO - https://ollama.com/install.sh | bash

USER ollama

WORKDIR /home/ollama

CMD ["/usr/local/bin/ollama", "serve"]
