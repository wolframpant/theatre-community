class Production < ActiveRecord::Base

  belongs_to :play
  belongs_to :user
  has_many :impressions
  has_many :images, through: :impressions

  default_scope { order('date_opened DESC')}

end
