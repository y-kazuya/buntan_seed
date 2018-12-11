class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :content, null: false
      t.text :memo

      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
