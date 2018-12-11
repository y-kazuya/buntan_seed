class CreateManagerProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :manager_profiles do |t|
      t.integer :category, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
