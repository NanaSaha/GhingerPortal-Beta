class AddFullNameToPersonInfo < ActiveRecord::Migration
  def change
    add_column :person_infos, :full_name, :string
  end
end
