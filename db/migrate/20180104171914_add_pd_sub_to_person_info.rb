class AddPdSubToPersonInfo < ActiveRecord::Migration
  def change
    add_column :person_infos, :pd_sub, :boolean
  end
end
