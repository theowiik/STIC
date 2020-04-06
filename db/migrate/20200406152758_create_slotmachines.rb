class CreateSlotmachines < ActiveRecord::Migration[6.0]
  def change
    create_table :slotmachines do |t|
      t.string :name

      t.timestamps
    end
  end
end
