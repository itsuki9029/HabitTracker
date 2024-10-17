FROM --platform=linux/arm64 ruby:3.1.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN gem install bundler
RUN bundle install
COPY . /app
CMD ["rails", "server", "-b", "0.0.0.0"]