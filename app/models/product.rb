class Product < ApplicationRecord
  include ProductConcern

  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :name, presence: true
end
