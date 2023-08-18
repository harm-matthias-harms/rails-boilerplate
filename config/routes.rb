# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?

  # only user with roles admin should be able to access sidekiq
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
