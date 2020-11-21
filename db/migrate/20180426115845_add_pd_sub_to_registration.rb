class AddPdSubToRegistration < ActiveRecord::Migration
  def change
    add_column :registration, :pd_sub, :boolean
  end
end
