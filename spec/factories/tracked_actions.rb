# frozen_string_literal: true

FactoryBot.define do
  factory :tracked_action do
    action { 'opened' }
    user_agent { 'blabla' }
    client_ip_address { '127.0.0.1' }
    tracking_link { build(:tracking_link) }
  end
end
