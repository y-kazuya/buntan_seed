class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.integer :state
      t.string :city
      t.string :avatar
      t.text :profile

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.boolean :admin, null: false, default: false
      t.timestamps
    end
  end
end
