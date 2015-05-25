class Production < ActiveRecord::Base
  
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  
  belongs_to :play
  belongs_to :user
  has_many :impressions
  has_many :images, through: :impressions
  
  def full_address
    "#{address}, #{city}, #{state}, #{country}"
  end
  
  geocoded_by :full_address # use geocoder gem
  after_validation :geocode # geocode street address to longitude and latitude, save in longitude and latitude attributes

  default_scope { order('date_opened DESC')}

end
