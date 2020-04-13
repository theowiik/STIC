class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.integer :rows, null: false, default: 1
      t.integer :columns, null: false, default: 1
      t.string :bitmap, null: false, default: '0'

      t.timestamps
    end

    execute 'ALTER TABLE lines ADD CONSTRAINT positive_rows CHECK(rows > 0);'
    execute 'ALTER TABLE lines ADD CONSTRAINT positive_columns CHECK(columns > 0);'
    execute 'ALTER TABLE lines ADD CONSTRAINT valid_bitmap_length CHECK(LENGTH(bitmap) = rows * columns);'
    execute "ALTER TABLE lines ADD CONSTRAINT valid_bitmap_characters CHECK(bitmap ~* '^[0|1]+$');"
  end
end
