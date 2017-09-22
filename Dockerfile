FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /noteapp
WORKDIR /noteapp

ADD Gemfile /noteapp/Gemfile
ADD Gemfile.lock /noteapp/Gemfile.lock

RUN bundle install

ADD . /noteapp

RUN rake assets:precompile RAILS_ENV=production

EXPOSE 3000

CMD ["/bin/bash", "/noteapp/bin/d_entrypoint.sh"]