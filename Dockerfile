FROM ruby:3.2.2-alpine

RUN apk update && \
    apk add g++ make mysql-dev tzdata

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install
