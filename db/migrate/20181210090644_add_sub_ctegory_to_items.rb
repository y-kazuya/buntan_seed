class AddSubCtegoryToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :sub_category, :integer
  end
end
