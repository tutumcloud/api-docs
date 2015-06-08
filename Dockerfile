FROM ubuntu:trusty
MAINTAINER fernando@tutum.co

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq ruby ruby-dev build-essential git awscli
RUN gem install --no-ri --no-rdoc bundler
ADD slate/ /app
ADD Gemfile /app/Gemfile
RUN rm -f /app/Gemfile.lock && cd /app && bundle install
EXPOSE 4567
WORKDIR /app

ADD publish.sh /app/publish.sh
ADD source /app/source

ENV PATH $PATH:/app
ENV AWS_ACCESS_KEY_ID **setme**
ENV AWS_SECRET_ACCESS_KEY **setme**
ENV BUCKET s3://docs.tutum.co/v2/api/

CMD ["bundle", "exec", "middleman", "server"]