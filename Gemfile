source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'haml'
gem 'haml-rails'
gem 'paper_trail'
gem 'devise'
gem 'cancan'
gem 'acts_as_tree', "0.2.0"
gem 'attr_encrypted'
gem 'jquery-rails'
gem 'sequel'
gem 'acts_as_sanitiled'
gem 'paperclip', "~>2.7"
gem 'chronic'
gem 'capistrano-ext'
gem 'therubyracer'
gem 'libv8', '~> 3.11.8'
gem 'will_paginate'
gem 'acts-as-taggable-on'
gem "high_voltage"
gem "nokogiri"


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem "compass", ">= 0.11.5"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

group :development, :test do
  gem 'execjs'
  gem 'ruby-debug'
end

group :osx do
  gem 'rb-fsevent'
  gem 'growl'
end

group :linux do
  gem 'libnotify'
  gem 'rb-inotify'
end

group :development do
  #gem 'rails-dev-boost', :git => 'git://github.com/thedarkone/rails-dev-boost.git'
  gem 'cheat'
  gem 'ruby_parser'
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec-rails-mocha'
  gem 'guard', "1.6.0"
  gem 'listen', "0.6.0"
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'mocha'  
  gem 'factory_girl', "~> 2.0"
  if RUBY_PLATFORM.downcase.include?("darwin")
    gem 'rb-fsevent'
    gem 'growl'
  else
    gem 'libnotify'
    gem 'rb-inotify'
  end
  gem 'spork'
end