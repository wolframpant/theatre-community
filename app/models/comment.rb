class Comment < ActiveRecord::Base
  belongs_to :impression
  belongs_to :user
end
