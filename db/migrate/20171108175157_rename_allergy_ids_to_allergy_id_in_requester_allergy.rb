class RenameAllergyIdsToAllergyIdInRequesterAllergy < ActiveRecord::Migration
  def change
    rename_column :requester_allergies, :allergy_ids, :allergy_id
  end
end
