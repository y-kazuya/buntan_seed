class AddItemsTorejectString < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :reject_text, :text
  end
end
