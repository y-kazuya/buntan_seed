class ChangeItemTocategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :category
    remove_column :items, :sub_category
    add_reference :items, :category, foreign_key: true
    add_reference :items, :sub_category, foreign_key: true
  end
end
