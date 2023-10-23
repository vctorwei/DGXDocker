FROM nvcr.io/nvidia/pytorch:21.11-py3

ARG USER_ID
ARG GROUP_ID
ARG USER

ENV TZ=Europe/London

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y sudo \
    libgl1-mesa-glx \
    ffmpeg \
    libimage-exiftool-perl

COPY ./requirements.txt .
RUN pip3 install -r requirements.txt


RUN addgroup --gid $GROUP_ID $USER
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER

WORKDIR /nfs/home/$USER
EXPOSE 8888
