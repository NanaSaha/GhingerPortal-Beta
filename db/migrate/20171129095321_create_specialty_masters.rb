class CreateSpecialtyMasters < ActiveRecord::Migration
  def change
    create_table :specialty_masters do |t|
      t.string :title
      t.string :alias
      t.string :comment
      t.string :user_id
      t.string :entity_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
