class CreateBuildingInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :building_infos do |t|
      t.text :about, null: false
      t.text :status, null: false
      t.string :price, null: false
      t.boolean :rent, null: false, default:  false


      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
