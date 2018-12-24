class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true, null: false
      t.references :item_contact, foreign_key: true, null: false

      t.text :text
      t.string :image
      t.timestamps
    end
  end
end
