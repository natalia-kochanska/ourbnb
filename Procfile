web: bundle exec rails server -p $PORT
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -c 5 -v
