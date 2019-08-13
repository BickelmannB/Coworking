class Reservation < ApplicationRecord
  belongs_to :workplace
  belongs_to :user
end
