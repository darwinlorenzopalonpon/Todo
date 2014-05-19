class CreatePrioritizations < ActiveRecord::Migration
  def change
    create_table :prioritizations do |t|
      t.integer :item_id
      t.string :item_type
      t.integer :priority_id
    end
  end
end
