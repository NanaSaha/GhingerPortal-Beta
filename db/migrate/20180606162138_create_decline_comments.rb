class CreateDeclineComments < ActiveRecord::Migration
  def change
    create_table :decline_comments do |t|
      t.integer :pre_confirmed_appointment_id
      t.datetime :available_date
      t.string :comment
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
