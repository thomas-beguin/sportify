class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :end_date, comparison: {greater_than: :start_date}
end
