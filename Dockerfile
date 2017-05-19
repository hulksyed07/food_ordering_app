FROM ruby:2.3.3

RUN apt-get update -qq \
  && apt-get install -y build-essential

RUN mkdir /food_ordering_app
WORKDIR /food_ordering_app

ADD Gemfile /food_ordering_app/Gemfile
ADD Gemfile.lock /food_ordering_app/Gemfile.lock

RUN bundle install

ADD . /food_ordering_app