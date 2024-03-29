FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /lambdaGPTrader
WORKDIR /lambdaGPTrader
ADD Gemfile /lambdaGPTrader/Gemfile
ADD Gemfile.lock /lambdaGPTrader/Gemfile.lock
RUN bundle install
ADD . /lambdaGPTrader
