class AddphoneTomanager < ActiveRecord::Migration[5.0]
  def change
    add_column :manager_profiles, :phone_number, :string
    remove_column :owner_profiles, :phone_number
  end
end
