class Group < ApplicationRecord
  belongs_to :user
  # through: :memberships

  has_many :dinners, dependent: :destroy
  has_many :memberships
  has_many :invites
end
