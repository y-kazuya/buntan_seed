class CreateItemUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :item_usages do |t|
      t.references :item, foreign_key: true, null: false
      t.references :usage, foreign_key: true, null: false
      t.timestamps
    end
  add_index :item_usages, [:item_id, :usage_id], unique: true
  end
end
