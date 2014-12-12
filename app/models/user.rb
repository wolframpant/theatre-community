class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :impressions
  has_many :comments
  has_many :productions
  
  mount_uploader :avatar, AvatarUploader

  def admin?
    admin == true
  end
 
end
