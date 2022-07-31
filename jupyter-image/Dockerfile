FROM jupiter.ramvarra.com:5000/ramvarra/python:latest

ENV USER=somebody
ENV UID=1000
ENV HOMEDIR=/home/${USER}
ENV TINI_VERSION v0.19.0
ARG NOTEBOOK_DIR=/var/notebooks

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod a+rx /tini

RUN \
    useradd -m -u ${UID} -d ${HOMEDIR} ${USER} -c "User account for container" \
    && mkdir ${HOMEDIR}/.jupyter \
    && mkdir -p ${NOTEBOOK_DIR}

COPY jupyter_notebook_config.py ${HOMEDIR}/.jupyter/

RUN \
    chown -R ${USER}:${USER} ${HOMEDIR} ${NOTEBOOK_DIR}

USER ${USER}

ENTRYPOINT ["/tini", "--"]

WORKDIR ${NOTEBOOK_DIR}

CMD ["jupyter", "notebook"]
