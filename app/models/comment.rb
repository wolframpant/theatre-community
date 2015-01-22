class Comment < ActiveRecord::Base
  attr_accessor :user_id
  
  belongs_to :impression
  belongs_to :user
 
  default_scope {order('created_at DESC')}
   
end
