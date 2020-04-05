Rails.application.routes.draw do
  scope :api do
    resources :tracking_links, only: [:create]
    get "tracked_actions/persist/:message_id", to: "tracked_actions#persist", as: :tracked_action_persist
  end
end
