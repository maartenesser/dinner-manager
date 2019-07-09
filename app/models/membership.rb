class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :attendees, dependent: :destroy

  # validates :user_id, uniqueness: true, scope: :group_id
  validates_uniqueness_of :user_id, scope: :group_id
end
