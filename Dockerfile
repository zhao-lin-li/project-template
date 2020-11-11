FROM registry.access.redhat.com/ubi8/ubi as development

ARG APP_DIR
WORKDIR ${APP_DIR}/

USER root
RUN rpm -ivh \
  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum --nobest --assumeyes update && yum --allowerasing --assumeyes install \
    ShellCheck \
  && yum clean all

COPY . ${APP_DIR}


FROM development as builder
RUN scripts/build_app.sh


FROM registry.access.redhat.com/ubi8/ubi-minimal as production

ARG APP_DIR
WORKDIR ${APP_DIR}/

#RUN microdnf install \
#  && microdnf clean all

COPY . ${APP_DIR}

