class AddTestListToPreAapointment < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :test_list, :text
  end
end
