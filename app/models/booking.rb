class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :end_date, comparison: { greater_than: :start_date }
  enum :status, { pending: 0, accepted: 1, refused: 2, passed: 3 }
end
