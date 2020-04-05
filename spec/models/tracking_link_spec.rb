# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrackingLink, type: :model do
  it { should validate_presence_of(:message_id) }
  it { should validate_presence_of(:user_id) }

  it "validates uniqueness of message id" do
    create(:tracking_link)
    should validate_uniqueness_of(:message_id)
  end

  it { should belong_to(:user) }
  it { should have_many(:tracked_actions).dependent(:destroy) }
end
