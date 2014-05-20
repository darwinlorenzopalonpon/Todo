class Priority < ActiveRecord::Base
  has_many :tasks
  default_scope { order('priority_num ASC') }
end