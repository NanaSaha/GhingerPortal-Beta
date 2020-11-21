class ChangeRegIdTypeInPersonInfos < ActiveRecord::Migration
  def change
    change_column :person_infos, :reg_id, 'integer USING CAST(reg_id AS integer)'
  end
end
