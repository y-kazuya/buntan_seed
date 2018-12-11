class CreateFoodInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :food_infos do |t|
      t.string :raw ,null: false
      t.string :amount
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
