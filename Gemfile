source 'https://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'twitter-bootstrap-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'best_in_place'
gem 'devise'
gem 'omniauth-facebook'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'simple_form'

gem 'spreadsheet'
gem 'paperclip'
gem 'prawn', :git => 'git://github.com/prawnpdf/prawn.git'

gem 'passenger'
gem 'capistrano'
gem 'git-deploy'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
group :development, :test do
  gem 'rspec-rails', '2.9.0'
  gem 'guard-rspec', '0.5.5'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails'
  gem 'rb-fsevent', :git => 'git://github.com/ttilley/rb-fsevent.git', :branch => 'pre-compiled-gem-one-off'
  gem 'growl', '1.0.3'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  
end
# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
gem 'debugger', group: [:development, :test]