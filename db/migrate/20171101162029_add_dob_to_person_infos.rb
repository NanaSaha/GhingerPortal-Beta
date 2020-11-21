class AddDobToPersonInfos < ActiveRecord::Migration
  def change
    add_column :person_infos, :dob, :date
  end
end
