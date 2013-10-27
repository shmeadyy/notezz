source 'https://rubygems.org'
ruby "1.9.3"

gem 'sinatra'
gem 'sinatra-activerecord'
gem 'dotenv'


group :production, :staging do
  gem 'pg'
end


group :development, :test do
  gem 'sqlite3'
  gem 'shotgun'
  gem 'capybara'
  gem 'rspec'
  gem 'jasmine'
end
