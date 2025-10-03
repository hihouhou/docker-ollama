#
# Ollama server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

LABEL org.opencontainers.image.authors="hihouhou@hihouhou.com"

ENV OLLAMA_VERSION=v0.12.4

# Update & install packages for Ollama
RUN apt-get update && \
    apt-get install -y netcat-traditional wget curl gnupg ca-certificates lsb-release

RUN useradd -ms /bin/bash ollama

RUN mkdir -p /home/ollama && \
    usermod -u 1000 ollama

#RUN wget -q https://ollama.com/install.sh | bash
RUN curl -L https://ollama.com/download/ollama-linux-amd64.tgz | tar zx -C /usr/local/ && \
    chmod +x /usr/local/bin/ollama

USER ollama

WORKDIR /home/ollama

CMD ["/usr/local/bin/ollama", "serve"]
