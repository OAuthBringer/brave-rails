FROM ruby:3.0.3

RUN apt-get clean && apt-get update 
RUN apt-get install -qq -y build-essential libpq-dev postgresql-client postgresql nodejs
EXPOSE 3000

RUN mkdir -p /var/www/
WORKDIR /var/www/
COPY api .
RUN bundle install
CMD bin/start
