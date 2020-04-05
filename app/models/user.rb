class User < ApplicationRecord
  has_many :tracking_links, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
