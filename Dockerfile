FROM registry.access.redhat.com/ubi8/ubi as development
ARG APP_DIR=/usr/src/app/
WORKDIR ${APP_DIR}/

#RUN yum --nobest --assumeyes update && yum --allowerasing --assumeyes install \
#  && yum clean all # this will error out if no packages are listed above for installation

COPY . ${APP_DIR}


FROM development as builder
RUN scripts/build_app.sh


FROM registry.access.redhat.com/ubi8/ubi-minimal as production
ARG APP_DIR=/usr/src/app/
WORKDIR ${APP_DIR}/

#RUN microdnf update && microdnf install \
#  && microdnf clean all # this will error out if no packages are listed above for installation

COPY . ${APP_DIR}

