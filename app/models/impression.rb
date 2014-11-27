class Impression < ActiveRecord::Base
  belongs_to :play
  has_many :comments
end
