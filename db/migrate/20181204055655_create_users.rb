class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :frist_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false

      t.integer :state, null: false
      t.string :city, null: false
      t.string :avatar
      t.text :profile
      t.boolean :owner, null: false ,default: false
      t.boolean :manager, null: false ,default: false

      t.boolean :admin, null: false, default: false
      t.timestamps
    end
  end
end
