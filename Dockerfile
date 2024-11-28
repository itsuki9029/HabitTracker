FROM ruby:3.2.0-alpine

# 必要なパッケージをインストール
RUN apk update && \
    apk upgrade && \
    apk add --no-cache gcompat && \
    apk add --no-cache linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql git bash vim g++ && \
    apk add --virtual build-packages --no-cache build-base curl-dev

# アプリケーションディレクトリを作成
RUN mkdir /myapp
WORKDIR /myapp

# Gemfile をコピーして依存関係をインストール
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install --without development test

# ビルド用パッケージの削除
RUN apk del build-packages

# アプリケーションコードを追加
ADD . /myapp
COPY . .
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# ポートを開放
EXPOSE 3000

CMD [ "rails","server","-b","0.0.0.0" ]
