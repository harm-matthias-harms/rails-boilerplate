# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  Healthcheck.routes(self)

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?

  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => 'good_job'
  end

  scope module: :home do
    get :imprint
    get :privacy_policy
    get :terms_of_service
  end

  resources :identities, only: %i[destroy]
end
