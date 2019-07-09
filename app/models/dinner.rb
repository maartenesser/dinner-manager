class Dinner < ApplicationRecord
  belongs_to :group
  has_many :attendees, dependent: :destroy
end
