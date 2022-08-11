FROM python:3.9-bullseye

ARG RUN_ID

ARG MODEL_NAME

ENV PATH /usr/local/bin:$PATH

ENV HOME /home/mlflowserver

COPY ./requirements.txt /tmp

RUN mkdir -p ${HOME}/mlflow/mlruns &&\
    pip install --upgrade pip &&\
    pip install -r /tmp/requirements.txt &&\
    apt-get update &&\
    apt-get install -y gcc git

