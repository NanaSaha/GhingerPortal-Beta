class AddDoctorIdToDeclineComments < ActiveRecord::Migration
  def change
    add_column :decline_comments, :doctor_id, :integer
    add_column :decline_comments, :nurse_id, :integer
  end
end
