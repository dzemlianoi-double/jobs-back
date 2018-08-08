# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope 'apis/v1', module: 'apis/v1', as: 'apis_v1', defaults: { format: :json } do
    post 'basic_configurations', to: 'configurations#basic'
    resources :services, only: %i[index]
    resources :claims, only: %i[create]
    resources :reviews, only: %i[index]
    resources :vacancies, only: %i[index show]
    resources :specialities, only: %i[index]
  end
end
