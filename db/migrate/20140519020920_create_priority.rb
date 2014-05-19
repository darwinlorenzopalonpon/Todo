class CreatePriority < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :priority_num, limit: 1
    end
  end
end
