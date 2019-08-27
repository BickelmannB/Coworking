class Reservation < ApplicationRecord
  belongs_to :workplace
  belongs_to :user
    def start_time
        self.starting_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end

    def periode(reservations)

    end
end
