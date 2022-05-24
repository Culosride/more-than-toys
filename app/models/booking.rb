class Booking < ApplicationRecord
  belongs_to :toy
  belongs_to :user

  validates :price, presence: true, numericality: true
  # validates_uniqueness_of :toy_id, scope: :booking_id
end
