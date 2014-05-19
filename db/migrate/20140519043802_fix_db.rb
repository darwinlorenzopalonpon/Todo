class FixDb < ActiveRecord::Migration
  def change
    rename_column :tasks, :priority, :priority_id
    drop_table :prioritizations
  end
end
