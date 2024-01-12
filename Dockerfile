FROM ruby:latest
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /Notes-App
COPY Gemfile /Notes-App/Gemfile
COPY Gemfile.lock /Notes-App/Gemfile.lock
RUN bundle install
COPY . /Notes-App
