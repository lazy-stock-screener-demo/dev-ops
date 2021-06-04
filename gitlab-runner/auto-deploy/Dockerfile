FROM "registry.gitlab.com/gitlab-org/cluster-integration/helm-install-image/releases/3.5.3-kube-1.16.15-alpine-3.12"

LABEL maintainer_email="universetennis@gmail.com"
LABEL maintainer="Daniel Lin"

USER root
RUN apk add --no-cache openssl curl tar gzip bash
COPY ./gitlab-runner/auto-deploy/src /build
COPY ./helm /helm-chart

# Install istioctl
ENV ISTIO_VERSION=1.6.8
RUN curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} TARGET_ARCH=x86_64 sh -
ENV PATH="$PATH:/istio-${ISTIO_VERSION}/bin"

# Install Dependencies
RUN chmod +x /build/auto-deploy.sh && ln -s /build/auto-deploy.sh /usr/local/bin/auto-deploy 