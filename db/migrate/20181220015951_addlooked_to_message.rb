class AddlookedToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :looked, :boolean, default: false
  end
end
