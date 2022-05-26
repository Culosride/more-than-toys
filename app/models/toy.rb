class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  validates :description, :name, :cuteness, :price_daily, :address, presence: true
  validates :cuteness, :soul_taking_chance, :price_daily, numericality: true
  validates :name, length: { maximum: 14 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CITIES = ["Berlin, Karl-Marx-strasse 127", "Milano, via Tortona 5", "Bogotà, Calle 127", "Hamburg, Horner landstrasse 125"].freeze
end
