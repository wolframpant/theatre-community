class Impression < ActiveRecord::Base
  belongs_to :production
  belongs_to :user
  has_many :comments

  delegate :play, to: :production

  default_scope { order('created_at DESC')}
  
end
