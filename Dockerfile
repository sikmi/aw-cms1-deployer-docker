FROM ruby:2.6.2

ENV LANG C.UTF-8
ENV DOCKER_VERSION=17.03.0-ce
RUN set -ex \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get update \
    && apt-get install -y \
                 nodejs \
                 gzip \
                 awscli \
                 jq \
                 --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g yarn \
    && echo "####################################" \
    && echo docker install \
    && curl -L -o /tmp/docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz  \
    && tar -xz -C /tmp -f /tmp/docker-${DOCKER_VERSION}.tgz \
    && mv /tmp/docker/* /usr/bin \
    && echo "####################################" \
    && echo ecs cli install \
    && curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest \
    && chmod 755 /usr/local/bin/ecs-cli
