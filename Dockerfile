FROM ruby:2.5.0

RUN apt-get update && \
    apt-get install -y net-tools unzip

# Installing Consul
RUN wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip
RUN unzip consul_1.0.6_linux_amd64.zip
RUN cp consul /usr/bin
COPY config.json $APP_HOME/

# Installing gems
ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Upload source
COPY . $APP_HOME

# Start server
ENV PORT 3000
EXPOSE 3000

CMD ["./start.sh"]
