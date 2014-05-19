class Priority < ActiveRecord::Base
  default_scope order('priority_num ASC')
end