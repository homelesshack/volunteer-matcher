FROM madetech/docker-rails-deps:ruby2.4.1

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
ENV BUNDLE_PATH /bundle
