class Image < ActiveRecord::Base
  
  belongs_to :impression
  
  has_one :production, through: :impression
  has_one :user, through: :impression
  
  
  mount_uploader :location, ImageUploader
  
end
