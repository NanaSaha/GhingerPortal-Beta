class RenameDelStatusToChangeStatus < ActiveRecord::Migration
  def change
    rename_column :country_masters, :del_status, :change_status
  end
end
