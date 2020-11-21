class RenameDelStatusToChangeStatus < ActiveRecord::Migration
  def change
    rename_column :country_masters, :del_status, :change_status
    rename_column :suburb_masters, :del_status, :change_status
    rename_column :region_masters, :del_status, :change_status
    rename_column :city_town_masters, :del_status, :change_status
  end
end
