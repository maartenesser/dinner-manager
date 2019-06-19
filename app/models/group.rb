class Group < ApplicationRecord
  belongs_to :user

  has_many :dinners, dependent: :destroy
  has_many :memberships
end
