class Task < ActiveRecord::Base

  belongs_to :priority

  validates_presence_of :todo
  accepts_nested_attributes_for :priority

  def self.search(search)
    if search
      where("todo LIKE :keyword OR memo LIKE :keyword", keyword: "%#{search}%")
    else
      self
    end
  end

  def self.paginated_for_index(tasks_per_page, current_page)
    page(current_page).per(tasks_per_page)
  end

  def self.order_by(column, direction = 'ASC')
    column = "created_at" if !Task.column_names.include?(column.to_s) || column.blank?
    order("#{column} #{direction}")
  end
end
