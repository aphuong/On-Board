class Todo < ActiveRecord::Base
  has_many :user_todos
end
