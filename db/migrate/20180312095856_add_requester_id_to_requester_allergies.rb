class AddRequesterIdToRequesterAllergies < ActiveRecord::Migration
  def change
    add_column :requester_allergies, :requester_id, :integer
  end
end
