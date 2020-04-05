# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    resources :tracking_links, only: [:create]
    get 'tracked_actions/opened/:message_id', to: 'tracked_actions#opened', as: :tracked_action_opened
  end
end
