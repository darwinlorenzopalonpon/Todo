class Task < ActiveRecord::Base
  default_scope { order('due_date ASC') }

  belongs_to :priority
  
  validates_presence_of :todo
  accepts_nested_attributes_for :priority
end
