class AddBalanceConstraint < ActiveRecord::Migration[6.0]
  def change; end

  # def up
  #   execute 'ALTER TABLE users ADD CONSTRAINT non_negative_balance CHECK(balance >= 0);'
  # end

  # def down
  #   execute 'ALTER TABLE users DROP CONSTRAINT non_negative_balance;'
  # end
end
