class CreateBalanceBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :balance_banks do |t|
      t.integer :balance
      t.integer :balance_achive
      t.string :code
      t.boolean :enable

      t.timestamps
    end
  end
end
