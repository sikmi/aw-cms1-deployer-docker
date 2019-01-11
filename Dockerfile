FROM sikmi/ruby253-deployer-docker:v20190111

RUN set -ex \
    && wget -qO- https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update \
    && apt-get install -y \
                 nodejs \
                 --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g yarn

