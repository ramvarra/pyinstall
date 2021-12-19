FROM ubuntu:latest

ENV PYTHON_VERSION=3.10.0
ENV TMP_BUILD_DIR=/tmp/python${PYTHON_VERSION}
ENV PYTHON_SRC_URL=https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz

RUN \
    apt-get update \
    && apt-get install wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev \
                        libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev \
                        liblzma-dev curl -y \
    && mkdir -p ${TMP_BUILD_DIR} \
    && cd ${TMP_BUILD_DIR} \
    && wget ${PYTHON_SRC_URL} \
    && tar xf Python-${PYTHON_VERSION}.tgz \
    && cd Python-${PYTHON_VERSION}/ \
    && ./configure --enable-optimizations \
    && make \
    && make altinstall \
    && cd / \
    && rm -rf ${TMP_BUILD_DIR} \
    && ln -s /usr/local/bin/python3.10 /usr/local/bin/python3

RUN \
    python3.10 -m pip install --upgrade pip \
    && python3.10 -m pip install numpy pandas jupyter requests pytz \
                        api4jenkins

CMD ["bash"]