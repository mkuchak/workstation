FROM ubuntu:rolling
WORKDIR /home/Workspaces

ENV LANG=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

COPY setup.sh /tmp/

RUN bash /tmp/setup.sh && rm -rf /tmp/setup.sh