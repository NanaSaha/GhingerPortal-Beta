class CreateMeasureUnits < ActiveRecord::Migration
  def change
    create_table :measure_units do |t|
      t.string :unit_desc
      t.string :unit_alias
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
