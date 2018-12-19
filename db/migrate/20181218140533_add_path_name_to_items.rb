class AddPathNameToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :path_name, :string
  end
end
