FROM ubuntu:16.04

# install dependencies
RUN apt-get update  && apt-get install -y \
    build-essential \
    gcc-multilib \
    zlib1g-dev \
    curl \
    wget \
    cmake \
    libxml2-dev \
    cpanminus \
    apt-utils \
    dpkg-dev \
    libperl-dev \
    libxml-libxml-perl

# install sra-toolkit
WORKDIR /tmp
RUN wget "https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.10.0/sratoolkit.2.10.0-ubuntu64.tar.gz" && \ 
    tar -zxvf sratoolkit.2.10.0-ubuntu64.tar.gz
RUN cp -r sratoolkit.2.10.0-ubuntu64/bin/* /usr/bin

# Cleanup
RUN rm -rf /tmp/sratoolkit.2.10.0-ubuntu64*
RUN apt-get clean
