class CreateDrugMasters < ActiveRecord::Migration
  def change
    create_table :drug_masters do |t|
      t.string :drug_name
      t.string :drug_alias
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
