class CreateBalanceBankHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :balance_bank_histories do |t|
      t.belongs_to :balance_bank
      t.integer :balance_before
      t.integer :balance_after
      t.string :activity
      t.integer :transaction_type
      t.string :ip
      t.string :location
      t.string :user_agent
      t.string :author

      t.timestamps
    end
  end
end
