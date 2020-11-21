class CreateReferals < ActiveRecord::Migration
  def change
    create_table :referals do |t|
      t.string :surname
      t.string :other_names
      t.date :dob
      t.string :contact
      t.integer :refered_by
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
