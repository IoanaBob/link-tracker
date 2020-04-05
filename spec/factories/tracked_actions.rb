# frozen_string_literal: true

FactoryBot.define do
  factory :tracked_action do
    action { "opened" }
    tracking_link { build(:tracking_link) }
  end
end
