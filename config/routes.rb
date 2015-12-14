require 'resque/server'

Rails.application.routes.draw do

  resque_web = Rack::Auth::Basic.new(Resque::Server) do |username, password|
    username == 'echo'
    password == 'foxtrot'
  end
  mount resque_web, at: '/resque'

  root to: 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users, except: :index

end
