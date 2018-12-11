class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :category, null: false
      t.integer :status, null: false
      t.text :profile, null: false
      t.text :remark
      t.integer :state, null: false
      t.string :city, null: false
      t.text :comment
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
