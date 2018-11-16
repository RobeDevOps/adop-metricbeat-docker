FROM docker.elastic.co/beats/metricbeat:6.5.0
LABEL MAINTAINER="roberto cardenas"
LABEL MAINTAINER_EMAIL="rcardenas20@gmail.com"

ENV METRICBEAT_HOME /usr/share/metricbeat
COPY config/metricbeat.yml ${METRICBEAT_HOME}/metricbeat.yml
USER root
RUN rm -Rf ${METRICBEAT_HOME}/modules.d/*
COPY modules.d/docker.yml ${METRICBEAT_HOME}/modules.d/docker.yml
RUN chown root:metricbeat ${METRICBEAT_HOME}/metricbeat.yml
RUN chown root:metricbeat ${METRICBEAT_HOME}/modules.d/docker.yml
USER metricbeat