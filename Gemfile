source 'http://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'activerecord-mysql2-adapter'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
 gem 'coffee-rails'
 gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
#gem 'therubyracer'
gem 'country_select'
gem 'simple_form'
gem 'mailchimp'
gem "geocoder"
gem 'meta-tags', :require => 'meta_tags'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
#gem 'capistrano'
#gem 'rvm-capistrano'

group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
end

gem 'puma'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

