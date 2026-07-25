# syntax=docker/dockerfile:1
ARG RUBY_VERSION=4.0.1
FROM docker.io/library/ruby:$RUBY_VERSION-slim

# 開発に必要なパッケージ（curl, sqlite3, そして git）をベースOSにインストール
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    git \
    sqlite3 \
    libvips \
    libyaml-dev \
    pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# アプリケーションの配置場所
WORKDIR /workspaces/personal-vital-record-app

# 開発環境（development）モードを明示的に指定
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle"

# サーバー起動用のポート3000を開放
EXPOSE 3000
CMD ["bash"]
