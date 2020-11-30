class CreateUserBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :user_balances do |t|
      t.integer :balance
      t.integer :balance_achive
      t.belongs_to :user

      t.timestamps
    end
  end
end
