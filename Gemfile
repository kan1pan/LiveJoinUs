source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'twitter-bootstrap-rails'
gem 'jquery-turbolinks'
gem 'devise'
gem 'faker'
gem 'rails_admin'
gem 'cancan'
gem 'activeresource'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'carrierwave'
gem 'mini_magick'
gem 'pusher'
gem 'streamio-ffmpeg'
gem 'flowplayer'
gem 'carrierwave-audio'
gem 'ransack'
gem 'gmaps4rails'
gem "geocoder"
gem 'kaminari'
gem 'whenever', require: false
gem 'nokogiri'
gem 'premailer-rails'
gem "rmagick", '~> 2.13.1', :require => 'RMagick'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry-rails'
  gem 'better_errors'
end

group :development do
  gem 'letter_opener_web'
  gem 'dotenv-rails'
end

gem 'rails_12factor', group: :production
