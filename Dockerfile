FROM registry.access.redhat.com/ubi8/ubi AS development
ARG APP_ROOT_CONTAINER=/usr/src/app/
WORKDIR ${APP_ROOT_CONTAINER}/

COPY scripts/install_dependencies.sh ${APP_ROOT_CONTAINER}/scripts/
RUN scripts/install_dependencies.sh

COPY . ${APP_ROOT_CONTAINER}


FROM development AS builder
RUN scripts/build_app.sh


FROM registry.access.redhat.com/ubi8/ubi-minimal AS production
ARG APP_ROOT_CONTAINER=/usr/src/app/
WORKDIR ${APP_ROOT_CONTAINER}/

#RUN microdnf update && microdnf install \
#  && microdnf clean all # this will error out if no packages are listed above for installation

COPY . ${APP_ROOT_CONTAINER}

