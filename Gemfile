source 'https://rubygems.org'

gem 'newrelic_rpm'
gem 'devise'
gem "haml"
gem 'simple_form'
gem 'carrierwave'
gem "rmagick"

gem 'heroku_secrets', github: 'alexpeattie/heroku_secrets'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails'

gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# A Rails engine for drawing your app's ER diagram
gem 'erd'

group :test do 
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rspec-collection_matchers'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'pry-rails'
end

group :development do
  gem "webconsole"
  gem "spring"
  gem "binding_of_caller"
  gem 'letter_opener'
end

group :production do
  gem 'rails_12factor'
end