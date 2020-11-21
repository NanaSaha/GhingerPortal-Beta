class CreateDrugPrices < ActiveRecord::Migration
  def change
    create_table :drug_prices do |t|
      t.integer :drug_id
      t.decimal :price
      t.integer :unit_id
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
