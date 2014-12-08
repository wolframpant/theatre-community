class Play < ActiveRecord::Base

   has_many :productions
   has_many :impressions
   has_many :comments, through: :impressions
  
end
