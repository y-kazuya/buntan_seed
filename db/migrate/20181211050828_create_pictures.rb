class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :content , null: false
      t.string :comment
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
