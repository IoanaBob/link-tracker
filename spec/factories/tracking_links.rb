# frozen_string_literal: true

FactoryBot.define do
  factory :tracking_link do
    message_id { "some-id-#{SecureRandom.uuid}" }
    recipient_email { 'other-email@email.com' }
    subject { 'Lorem ipsum dolor sit amet' }
    user { create(:user) }
  end
end
