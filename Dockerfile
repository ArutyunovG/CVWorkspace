FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04

ARG USER=username

ENV USER=${USER}

RUN apt update && apt install sudo && \
    adduser --shell /bin/bash --disabled-password --gecos "" ${USER} && \
    usermod -aG sudo ${USER}

ENV HOME /home/${USER}
WORKDIR ${HOME}

USER root

ADD . ${HOME}/CVWorkspace
RUN bash -i CVWorkspace/install.sh
