web: bundle exec puma -C config/initializers/puma.rb
worker: bundle exec rake jobs:work
resque: env TERM_CHILD=1 bundle exec rake resque:work
