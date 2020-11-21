class CreateProfesionalGroups < ActiveRecord::Migration
  def change
    create_table :profesional_groups do |t|
      t.string :group_name
      t.string :comment
      t.string :user_id
      t.string :entity_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
