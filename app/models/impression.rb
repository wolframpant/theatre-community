class Impression < ActiveRecord::Base
  belongs_to :play
  belongs_to :production
  belongs_to :user
  has_many :comments

  default_scope { order('created_at DESC')}
  
end
