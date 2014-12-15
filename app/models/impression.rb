class Impression < ActiveRecord::Base
  
  belongs_to :production
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
 
  default_scope { order('created_at DESC')}
  
end
