FROM python:3.9-bullseye

ARG RUN_ID

ARG MODEL_NAME

ENV HOME /home/mlflowserver
ADD crontab /etc/cron.d/daily_run
COPY ./requirements.txt /tmp

RUN mkdir -p ${HOME}/mlflow/mlruns &&\
    pip install --upgrade pip &&\
    pip install -r /tmp/requirements.txt &&\
    apt-get update &&\
    apt-get install -y gcc git &&\
    apt-get -y install cron &&\
    chmod 0644 /etc/cron.d/daily_run &&\
    touch /var/log/cron.log
    

