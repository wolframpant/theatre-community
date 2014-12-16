class Comment < ActiveRecord::Base
  belongs_to :impression
  belongs_to :user
 
  default_scope {order('created_at DESC')}
  
  def user_avatar
    u = User.find_by(:id => :user_id)
    u.avatar
  end
  
  def user_name
    u = User.find_by(:id => :user_id)
    u.name
  end
  
end
