FROM ruby:3.0

EXPOSE 3000

RUN mkdir -p /var/www/
WORKDIR /var/www/
COPY api .
RUN bundle install
CMD rails server
