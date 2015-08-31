source 'https://rubygems.org'

gem 'rake'

group :test, :integration do
  gem 'berkshelf', '~> 3.0'
end

group :test do
  gem 'rspec', '~>3'
  gem 'chefspec', '~> 4.0'
  gem 'foodcritic', '~> 4.0'
  gem 'stove', '~> 3.2'
end

group :integration do
  # gem 'kitchen-docker', '~> 1.5'
  gem 'test-kitchen', '~> 1.2'
end

group :development do
  gem 'rubocop', '~> 0'
end
