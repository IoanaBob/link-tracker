# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrackingLink, type: :model do
  it { should validate_presence_of(:message_id) }

  it { should belong_to(:user) }
  it { should have_many(:tracked_actions).dependent(:destroy) }
end
