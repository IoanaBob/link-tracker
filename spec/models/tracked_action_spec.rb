# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrackedAction, type: :model do
  it { should validate_presence_of(:action) }

  it { should belong_to(:tracking_link) }
end
