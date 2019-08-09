class Workplace < ApplicationRecord
  validates :name, presence: true
  validates :total_places, presence: true, numericality: { only_integer: true }
  validates :available_places, presence: true, numericality: { only_integer: true }
end
