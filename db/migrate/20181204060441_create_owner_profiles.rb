class CreateOwnerProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :owner_profiles do |t|

      t.string :phone_number, null: false, unique: true
      t.integer :category, null: false

      t.references :user, foreign_key: true, null: false
      t.timestamps
    end

  end
end
