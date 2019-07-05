class Attendee < ApplicationRecord
  belongs_to :dinner
  belongs_to :membership
end
