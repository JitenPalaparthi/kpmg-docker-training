FROM ubuntu

LABEL author="jitenp@outlook.com"

LABEL version="v0.0.1"

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install vim -y

RUN touch sample

RUN echo "hello world" >sample

# Install python in ubuntu
# Check steps how to install python on ubuntu
# the automate those steps
