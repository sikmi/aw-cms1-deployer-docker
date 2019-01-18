FROM sikmi/ruby253-deployer-docker:v20190111

# gem install bundleすると現状2.0.1が入ってしまい
# 公式のruby docker imageで入るbundlerとバージョンが異なる(1.17系)0
# このせいでGemfile.lockのbundlerのバージョンが1.x系だとエラーになる
# ruby 2.6.0だとデフォルトでbundlerの1.17系がバンドルされてるのでビルドコンテナもそれに合わせる
RUN gem uninstall -ax bundler \
    && gem install -v 1.17.1 bundler

RUN set -ex \
    && wget -qO- https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update \
    && apt-get install -y \
                 nodejs \
                 --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g yarn \
    && pip install -U awscli

