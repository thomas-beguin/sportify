class Product < ApplicationRecord
  include ProductConcern

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category_and_sport,
                  against: %i[name category sport],
                  using: {
                    tsearch: { prefix: true }
                  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :name, presence: true

  CATEGORY = [
    'Bikes & Cycling',
    'Dance',
    'Exercise & Fitness',
    'Golf',
    'Hike & Camp',
    'Outdoors',
    'Precision Sports',
    'Racket Sports',
    'Run & Walk',
    'Skates, Scooters & Skateboards',
    'Team Sports',
    'Water Sports',
    'Winter Sports'
  ]

  SPORT = [
    'Archery',
    'At Home Gym Equipment',
    'Badminton',
    'Ballet',
    'Baseball',
    'Basketball',
    'Billiards',
    'Boating & Paddle',
    'Boxing & MMA',
    'Cardio Machines & Equipment',
    'Darts',
    'Exercise & Fitness Accessories',
    'Exercise & Fitness Apparel',
    'Fishing',
    'Football',
    'Frisbee',
    'Hockey',
    'Horseback Riding',
    'Hunting',
    'Ice Skating',
    'Ice Skating',
    'Kites',
    'Mountaineering',
    'Mountaineering',
    'Petanque',
    'Pickleball',
    'Rock Climbing',
    'Roller Skating',
    'Rugby',
    'Running',
    'Sailing',
    'Scooters',
    'Skateboarding',
    'Skiing',
    'Sledding',
    'Snorkeling',
    'Snow Hiking',
    'Snowboarding',
    'Soccer',
    'Surfing & Bodyboarding',
    'Swimming',
    'Swingball',
    'Table Tennis',
    'Tennis',
    'Trail Running',
    'Triathlon',
    'Urban Dance',
    'Volleyball',
    'Walking',
    'Weight Training Gear',
    'Winter Accessories',
    'Winter Apparel',
    'Yoga'
  ]

  CONDITION = ["Is as new", "Is in good condition", "Shows signs of usage", "Is very old but still functionning"]

  validates :category, inclusion: { in: CATEGORY,
      message: "%{value} is not a valid category" }

  # validates :sport, inclusion: { in: SPORT,
  #   message: "%{value} is not a valid sport" }
end
