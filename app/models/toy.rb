class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :description, :name, :cuteness, :price_daily, :location, presence: true
  validates :cuteness, :soul_taking_chance, :price_daily, numericality: true
  validates :name, length: { maximum: 14 }

  CITIES = ["Berlin", "Cagliari", "Bogotà", "Buenos Aires"].freeze
end
