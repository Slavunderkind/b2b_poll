FROM ruby:3.3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs sqlite3

# Set up the working directory
WORKDIR /myapp

# Install Gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Copy the rest of the app
COPY . /myapp

# Precompile assets (if necessary)
# RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expose the port that the app will run on
EXPOSE 3000

# Command to run the app
CMD ["rails", "server", "-b", "0.0.0.0"]
