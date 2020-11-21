class ChangeAllergyIdToAllergyIdsInRequesterAllergies < ActiveRecord::Migration
  def change
    rename_column :requester_allergies, :allergy_id, :allergy_ids
  end
end
