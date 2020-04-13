class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.integer :rows
      t.integer :columns
      t.integer :bitmap

      t.timestamps
    end
  end
end
