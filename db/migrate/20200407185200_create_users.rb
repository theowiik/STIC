class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.integer :balance, null: false, default: 0

      t.timestamps
    end

    execute 'ALTER TABLE users ADD CONSTRAINT positive_balance CHECK(balance >= 0);'
  end
end
