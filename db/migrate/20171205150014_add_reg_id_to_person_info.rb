class AddRegIdToPersonInfo < ActiveRecord::Migration
  def change
    add_column :person_infos, :reg_id, :string
  end
end
