class Comment < ActiveRecord::Base
  belongs_to :impression
  belongs_to :user
 
  default_scope {order('created_at DESC')}
  
end
