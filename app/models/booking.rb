class Booking < ApplicationRecord
  STATUS = ["pending", "accepted", "refused", "passed"]
  belongs_to :product
  belongs_to :user
  validates :bookings, inclusion: { in: STATUS }
  validates :end_date, comparison: { greater_than: :start_date }
end
