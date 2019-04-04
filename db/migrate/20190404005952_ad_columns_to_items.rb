class AdColumnsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :price, :string

    add_column :items, :is_rent, :boolean
  end
end
