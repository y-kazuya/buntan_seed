class CreateSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.string :name , null: false, unique: true
      t.string :path_name, null: false, unique: true
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
