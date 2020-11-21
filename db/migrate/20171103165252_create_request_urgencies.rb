class CreateRequestUrgencies < ActiveRecord::Migration
  def change
    create_table :request_urgencies do |t|
      t.string :urgency
      t.string :ref_id

      t.timestamps null: false
    end
  end
end
