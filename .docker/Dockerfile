FROM python:3
#FROM ubuntu:22.04

# install basic libraries 
RUN apt-get update && apt-get install -y
RUN apt-get install -y --no-install-recommends --fix-missing vim curl gnupg2 wget lsb-release software-properties-common

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y --fix-missing tzdata

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir keymap-drawer

CMD mkdir /ws/
WORKDIR /ws/
