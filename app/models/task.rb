class Task < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  belongs_to :priority

  validates_presence_of :todo
  accepts_nested_attributes_for :priority

  scope :search, -> (keyword) { where("todo LIKE :keyword OR memo LIKE :keyword", keyword: "%#{keyword}%") }

  def self.paginated_for_index(tasks_per_page, current_page)
    paginate(per_page: tasks_per_page, page: current_page)
  end

end
