FROM ruby:2.5.3
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /channel-api
WORKDIR /channel-api
COPY Gemfile /channel-api/Gemfile
COPY Gemfile.lock /channel-api/Gemfile.lock
RUN bundle install
