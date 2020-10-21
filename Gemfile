# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', github: 'rails/rails', branch: 'master'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'jbuilder', '~> 2.7'
gem 'motion', '~> 0.4.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'view_component', require: 'view_component/engine'
gem 'webpacker', github: 'rails/webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotate'
  gem 'draft_generators', github: 'firstdraft/draft_generators', branch: 'winter-2020'
  gem 'listen', '~> 3.2'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', github: 'rails/web-console'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
