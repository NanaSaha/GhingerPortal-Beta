class AddProcessStatusToReferals < ActiveRecord::Migration
  def change
    add_column :referals, :processed_status, :boolean
  end
end
