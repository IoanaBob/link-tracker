class TrackingLink < ApplicationRecord
  belongs_to :user
  has_many :tracked_actions, dependent: :destroy

  validates :message_id, presence: true
end
