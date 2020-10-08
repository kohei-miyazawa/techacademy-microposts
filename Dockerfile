FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /microposts
WORKDIR /microposts

COPY Gemfile /microposts/Gemfile
COPY Gemfile.lock /microposts/Gemfile.lock

RUN bundle install
COPY . /microposts
