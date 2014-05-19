class Task < ActiveRecord::Base
  default_scope { order('due_date ASC') }
end
