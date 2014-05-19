class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :todo
      t.date :input_date
      t.date :due_dat
      t.integer :priority
      t.text :memo

      t.timestamps
    end
  end
end
