class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, index: true
      t.string :email, index: true
      t.text :password_digest

      t.timestamps
    end
  end
end
