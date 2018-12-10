FROM brainmaxz/was-scripting:0.6.5 as Create
LABEL maintainer="m.zambrini@informatica.aci.it"

ENV JYTHON_FILE_NAME was_script.py
COPY /config /config
RUN /work/main

ARG WAS_IMAGE=ibmcom/websphere-traditional:8.5.5.13-profile
FROM ${WAS_IMAGE}

ARG ADMIN_PASSWORD=iniziale

COPY /scripts /scripts
COPY /artifacts  /artifacts

COPY --from=Create /work/result/was_script.py /scripts

USER 0

RUN chown -R $USER:$GROUP /scripts && chmod -R a+x /scripts/*.sh 
 
USER $USER

RUN echo $ADMIN_PASSWORD > /tmp/PASSWORD
RUN set -x \
&& /scripts/apply-configuration.sh was_script.py

CMD ["/work/start_server"]
