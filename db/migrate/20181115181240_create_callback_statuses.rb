class CreateCallbackStatuses < ActiveRecord::Migration
  def change
    create_table :callback_statuses do |t|
      t.string :trans_status
      t.string :trans_id
      t.string :exttrid
      t.string :trans_msg

      t.timestamps null: false
    end
  end
end
