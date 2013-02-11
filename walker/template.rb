# maybe someday keep keys and stuff in here:
# maybe make an engine for styles and javascript
# gem 'walkerart', github: 'walkerart/walkerart-rails'


gem 'memcache-client', group: :staging
gem 'dalli', '2.3.0'
gem 'pg', '0.14.1'
gem 'will_paginate'
gem 'exception_notification', '3.0.0'
gem 'coffee-filter', '0.1.1'
gem 'json_builder', '3.1.7'
gem 'mobile-fu', '1.1.0'
gem 'haml-rails', '0.3.5'
gem 'hpricot', '0.8.6'
gem 'nokogiri', '1.5.5'
gem 'jquery-rails', '2.1.3'
gem 'rack-pjax', '0.6.0'


# styles
gem "susy", group: [:development, :assets]
gem 'compass', '>= 0.12.2'
gem 'compass-rails', '>= 1.0.3'
gem 'sass', '~> 3.2.0.alpha'
gem 'sass-rails',   '~> 3.2.3'
gem 'coffee-rails', '~> 3.2.1'
gem 'therubyracer', '0.10.2'
gem 'uglifier', '>= 1.0.3'

# images
gem 'rack-cache', '1.2', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.12'
gem 'image_optim',  '0.7.1'
gem 'mini_exiftool', '1.6.0'
gem 'fog', '1.8.0'

gem 'delayed_job'
