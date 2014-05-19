class FixTaskColumnName < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.rename :due_dat, :due_date
    end
  end
end
