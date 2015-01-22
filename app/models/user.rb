class User < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :impressions
  has_many :comments
  has_many :productions
  has_many :images, through: :impressions
  
  def admin?
    admin == true
  end
 
end
