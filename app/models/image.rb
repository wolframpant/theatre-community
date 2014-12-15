class Image < ActiveRecord::Base
  
  belongs_to :impression
  
  mount_uploader :location, ImageUploader
  
end
