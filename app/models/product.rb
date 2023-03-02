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
    'Weight Training Gear',
    'At Home Gym Equipment',
    'Cardio Machines & Equipment',
    'Exercise & Fitness Accessories',
    'Exercise & Fitness Apparel',
    'Yoga',
    'Boxing & MMA',
    'Ballet',
    'Urban Dance',
    'Fishing',
    'Horseback Riding',
    'Hunting',
    'Mountaineering',
    'Rock Climbing',
    'Archery',
    'Billiards',
    'Darts',
    'Frisbee',
    'Kites',
    'Petanque',
    'Badminton',
    'Swingball',
    'Table Tennis',
    'Tennis',
    'Pickleball',
    'Running',
    'Trail Running',
    'Triathlon',
    'Walking',
    'Roller Skating',
    'Skateboarding',
    'Ice Skating',
    'Scooters',
    'Basketball',
    'Baseball',
    'Football',
    'Hockey',
    'Rugby',
    'Soccer',
    'Volleyball',
    'Boating & Paddle',
    'Surfing & Bodyboarding',
    'Snorkeling',
    'Swimming',
    'Sailing',
    'Ice Skating',
    'Mountaineering',
    'Skiing',
    'Sledding',
    'Snowboarding',
    'Snow Hiking',
    'Winter Apparel',
    'Winter Accessories'
  ]

  CONDITION = ["Is as new", "Is in good condition", "Shows signs of usage", "Is very old but still functionning"]

  validates :category, inclusion: { in: CATEGORY,
      message: "%{value} is not a valid category" }

  # validates :sport, inclusion: { in: SPORT,
  #   message: "%{value} is not a valid sport" }
end
