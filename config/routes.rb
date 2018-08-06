# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope 'apis/v1', module: 'apis/v1', as: 'apis_v1', defaults: { format: :json } do
    post 'basic_configurations', to: 'configurations#basic'
  end
end
