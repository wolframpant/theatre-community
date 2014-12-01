class Production < ActiveRecord::Base

  belongs_to :play
  belongs_to :user
  has_many :impressions

end
