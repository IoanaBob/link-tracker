class TrackedAction < ApplicationRecord
  belongs_to :tracking_link

  validates :action, presence: true
end
