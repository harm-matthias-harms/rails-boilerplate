# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  if Rails.env.development?
    mount Lookbook::Engine, at: '/lookbook'
    mount Sidekiq::Web => '/sidekiq'
  end
end
