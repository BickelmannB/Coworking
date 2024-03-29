class Workplace < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  require 'activerecord-import/active_record/adapters/postgresql_adapter'
  geocoded_by :address
  validates :name, presence: true
  validates :total_places, presence: true, numericality: { only_integer: true }
  validates :description, presence: true,  length: { maximum: 70 }
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  mount_uploader :photo3, PhotoUploader
  after_validation :geocode

  def reservations_count(date)
    Reservation.where("workplace_id = :id AND starting_date <= :date AND ending_date >= :date",
                      id: id, date: date).count
  end

  def bookable?(begin_date, end_date)
    current_date = begin_date
    until current_date > end_date
      return false if reservations_count(current_date) == total_places

      current_date += 1
    end
    return true
  end

  def self.to_xlsx
    pack = Axlsx::Package.new
    wb = pack.workbook
    wb.add_worksheet(name: "Workplaces") do |sheet|
      # Create the header row
      sheet.add_row ["Workplace Name", "Total places", "Description"]
      # Create entries for each item
      where(nil).each do |workplace|
        sheet.add_row [workplace.name, workplace.total_places, workplace.description]
      end
    end
    pack
  end

  def self.my_import(file)
    workplace = []
    CSV.foreach(file.path, headers: true) do |row|
      workplace << Workplace.new(row.to_hash)
    end
    Workplace.import workplace, recursive: true
  end
end
