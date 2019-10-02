class Reservation < ApplicationRecord
  belongs_to :workplace
  belongs_to :user

  def start_time
    starting_date
  end
end
