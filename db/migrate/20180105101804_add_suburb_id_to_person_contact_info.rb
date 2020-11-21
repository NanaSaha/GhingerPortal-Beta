class AddSuburbIdToPersonContactInfo < ActiveRecord::Migration
  def change
    add_column :person_contact_infos, :suburb_id, :integer
  end
end
