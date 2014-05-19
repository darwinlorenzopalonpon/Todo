class Prioritization < ActiveRecord::Base
  belongs_to :priority
  belongs_to :item, polymorphic: true

end