class AdJobToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :job, :integer
  end
end
