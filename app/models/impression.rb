class Impression < ActiveRecord::Base
  belongs_to :play
  belongs_to :production
  belongs_to :user
  has_many :comments
end
