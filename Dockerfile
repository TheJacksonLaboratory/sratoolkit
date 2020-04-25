FROM continuumio/miniconda3:4.8.2

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
    libxml-libxml-perl \
    procps && apt-get clean -y

# install sra-toolkit
WORKDIR /tmp
RUN wget "https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.10.5/sratoolkit.2.10.5-ubuntu64.tar.gz" && \ 
    tar -zxvf sratoolkit.2.10.5-ubuntu64.tar.gz
RUN cp -r sratoolkit.2.10.5-ubuntu64/bin/* /usr/bin

# Cleanup
RUN rm -rf /tmp/sratoolkit.2.10.5-ubuntu64*
RUN apt-get clean
