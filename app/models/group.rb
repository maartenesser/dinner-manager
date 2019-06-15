class Group < ApplicationRecord
  belongs_to :user

  has_many :dinners
  has_many :memberships
end
