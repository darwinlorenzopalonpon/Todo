class Task < ActiveRecord::Base

  belongs_to :priority

  validates_presence_of :todo
  accepts_nested_attributes_for :priority

  def self.paginated_for_index(tasks_per_page, current_page)
    page(current_page).per(tasks_per_page)
  end

  def self.order_by(column, direction = 'ASC')
    if(column == "priority_id")
      column = "priorities.priority_num"
    elsif !Task.column_names.include?(column.to_s) || column.blank?
      column = "created_at"
    end
    includes(:priority).order("#{column} #{direction}")
  end
end
