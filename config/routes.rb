# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?

  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => 'good_job'
  end
end
