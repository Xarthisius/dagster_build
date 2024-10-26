# Dagster libraries to run both dagster-webserver and the dagster-daemon. Does not
# need to have access to any pipeline code.

FROM python:3.12-slim

ENV DAGSTER_VERSION=1.8.12 DAGSTER_LIBS_VERSION=0.24.12 DAGSTER_HOME=/opt/dagster/dagster_home/

RUN mkdir -p $DAGSTER_HOME

RUN pip install \
    dagster==${DAGSTER_VERSION} \
    dagster-graphql==${DAGSTER_VERSION} \
    dagster-webserver==${DAGSTER_VERSION} \
    dagster-postgres==${DAGSTER_LIBS_VERSION} \
    dagster-docker==${DAGSTER_LIBS_VERSION}

COPY dagster.yaml $DAGSTER_HOME

WORKDIR $DAGSTER_HOME
