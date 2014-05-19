class Task < ActiveRecord::Base
  default_scope { order('due_date ASC') }

  has_one :prioritization, class_name: 'Prioritization', as: :item
  has_one :priority, through: :prioritization
end
