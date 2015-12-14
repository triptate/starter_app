require 'resque/server'

Rails.application.routes.draw do

  resque_web = Rack::Auth::Basic.new(Resque::Server) do |username, password|
    password == 'socks'
  end
  mount resque_web, at: '/resque'

  root to: 'home#index'

  resources :users, except: :index

end
