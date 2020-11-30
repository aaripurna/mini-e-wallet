class CreateBlacklistedTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklisted_tokens do |t|
      t.text :token
      t.timestamps
    end
  end
end
