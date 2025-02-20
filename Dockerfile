FROM ruby:2.7.1

ENV LANG C.UTF-8

RUN mkdir /var/log/prod

RUN apt update \
  && apt upgrade -y \
  && apt install -y nodejs

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY . /app/

RUN bundle exec middleman build
