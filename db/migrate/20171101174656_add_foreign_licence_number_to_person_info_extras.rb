class AddForeignLicenceNumberToPersonInfoExtras < ActiveRecord::Migration
  def change
    add_column :person_info_extras, :foreign_licence_number, :string
  end
end
