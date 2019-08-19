class Workplace < ApplicationRecord
  validates :name, presence: true
  validates :total_places, presence: true, numericality: { only_integer: true }

  def reservations_count(date)
    Reservation.where("workplace_id = :id AND starting_date <= :date AND ending_date >= :date", id: id, date: date).count
  end

  def bookable?(begin_date, end_date)
    current_date = begin_date
    until current_date > end_date
      return false if reservations_count(current_date) == total_places

      current_date += 1
    end
    return true
  end
end
