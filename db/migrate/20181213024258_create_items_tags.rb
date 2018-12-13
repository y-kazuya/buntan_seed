class CreateItemsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :items_tags do |t|
      t.references :item, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false
      t.timestamps
    end
    add_index :items_tags, [:item_id, :tag_id], unique: true
  end
end
