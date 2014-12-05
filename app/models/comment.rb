class Comment < ActiveRecord::Base
  belongs_to :impression
  belongs_to :user
  belongs_to :play

  default_scope {order('created_at DESC')}
  
end
