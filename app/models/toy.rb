class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :description, :name, :cuteness, :price_daily, :location, :soul_taking_chance, presence: true
  validates :cuteness, :price_daily, :soul_taking_chance, numericality: true
  validates :name, length: { maximum: 14 }
end
