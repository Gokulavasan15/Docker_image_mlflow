FROM python:3.9-bullseye

ARG RUN_ID

ARG MODEL_NAME

ENV HOME /home/mlflowserver

COPY ./requirements.txt /tmp

RUN mkdir -p ${HOME}/mlflow/mlruns &&\
    pip install --upgrade pip &&\
    pip install -r /tmp/requirements.txt &&\
    apt-get update &&\
    apt-get install -y gcc git
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
