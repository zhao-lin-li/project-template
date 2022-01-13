FROM registry.access.redhat.com/ubi8/ubi as development
ARG APP_ROOT_CONTAINER=/usr/src/app/
WORKDIR ${APP_ROOT_CONTAINER}/

#RUN yum --nobest --assumeyes update && yum --allowerasing --assumeyes install \
#  && yum clean all # this will error out if no packages are listed above for installation

COPY . ${APP_ROOT_CONTAINER}


FROM development as builder
RUN scripts/build_app.sh


FROM registry.access.redhat.com/ubi8/ubi-minimal as production
ARG APP_ROOT_CONTAINER=/usr/src/app/
WORKDIR ${APP_ROOT_CONTAINER}/

#RUN microdnf update && microdnf install \
#  && microdnf clean all # this will error out if no packages are listed above for installation

COPY . ${APP_ROOT_CONTAINER}

