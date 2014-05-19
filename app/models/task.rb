class Task < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  belongs_to :priority

  validates_presence_of :todo
  accepts_nested_attributes_for :priority
end
