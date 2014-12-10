class Play < ActiveRecord::Base

   has_many :productions
   has_many :impressions, through: :productions
     
end
