# Docker Hubからruby:3.0.6のイメージをプルする
FROM ruby:3.0.6

# debian系のためapt-getを使用してnode.jsとyarnをインストール
RUN apt-get update -qq && apt-get install -y \
    curl \
    build-essential \
    libpq-dev \
    mariadb-client && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    npm install --global yarn && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# docker内の作業ディレクトリを作成＆設定
WORKDIR /rails_phr

# Gemfile,Gemfile.lockをローカルからCOPY
COPY Gemfile Gemfile.lock /rails_phr/

# コンテナ内にコピーしたGemfileを用いてbundle install
RUN gem install rubocop solargraph && \
    bundle install --jobs=4 --retry=3

# アプリケーションの全ファイルをコンテナにコピー
COPY . /rails_phr/

# 起動時に古いPIDファイルを削除 / デフォルトでrailsサーバーを起動
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && rails server -b 0.0.0.0"]
