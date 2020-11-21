class ChangePersonTypeIdInPersonInfo < ActiveRecord::Migration
  def change
    change_column :person_infos, :person_type_id, :string
  end
end
