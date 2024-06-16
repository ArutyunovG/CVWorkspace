FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

ARG USER=username

ENV USER=${USER}

RUN apt update && apt install -y sudo && apt install -y git && \
    apt-get install -y ssh && apt install -y libgl1 && \
    adduser --shell /bin/bash --disabled-password --gecos "" ${USER} && \
    usermod -aG sudo ${USER}

ENV HOME /home/${USER}
WORKDIR ${HOME}

ENV TZ=Europe/Moscow \
    DEBIAN_FRONTEND=noninteractive
RUN apt install -y tzdata
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN git clone https://github.com/ArutyunovG/CVWorkspace.git

RUN cd CVWorkspace && WITH_BASE_DEPS=1 bash -ix install.sh
RUN cd CVWorkspace && WITH_CAFFE_SSD=1 bash -ix install.sh
RUN cd CVWorkspace && WITH_PYTORCH=1 bash -ix install.sh
RUN cd CVWorkspace && WITH_TORCHVISION=1 WITH_FVCORE=1 WITH_DETECTRON2=1 bash -ix install.sh
RUN cd CVWorkspace && WITH_TENSORFLOW=1 bash -ix install.sh
RUN cd CVWorkspace && WITH_MIM=1 WITH_MMENGINE=1 WITH_MMCV=1 \
                      WITH_MMPRETRAIN=1 WITH_MMDETECTION=1 WITH_MMSEGMENTATION=1 bash -ix install.sh

RUN apt -y install openssh-server && mkdir -p /var/run/sshd && \
    sed -i 's/^#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "${USER}:{USER}"|chpasswd

USER ${USER}
RUN echo 'source ${HOME}/cv_workspace/libs/setup.sh' >> /home/${USER}/.bashrc
