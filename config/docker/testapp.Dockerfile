# Base image
FROM ruby:2.4.1
MAINTAINER mario@logicaltelecom.com

# Install Dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

# Set an environment variable to store where the app is installed inside docker image:
ENV RAILS_ROOT /var/www/testapp

# Create working directory, where commands will be ran:
RUN mkdir -p $RAILS_ROOT

# Setting the context of where commands will be ran in
WORKDIR $RAILS_ROOT

# Copy the Gemfile as well as the Gemfile.lock and install 
# the RubyGems. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./

# Expose port 3000 to the Docker host, so we can access it from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also 
# tell the Rails dev server to bind to all interfaces by 
# default.
CMD bundle exec rails s -p 3000 -b 0.0.0.0