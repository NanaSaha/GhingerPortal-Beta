class CreatePersonInfoExtras < ActiveRecord::Migration
  def change
    create_table :person_info_extras do |t|
      t.integer :person_id
      t.integer :specialty_id
      t.string :specialty_duration
      t.boolean :has_specialty
      t.boolean :forign_training
      t.string :foreign_institution_desc
      t.integer :profession_group_id
      t.string :licence_number
      t.string :comment
      t.integer :user_id
      t.integer :entity_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
