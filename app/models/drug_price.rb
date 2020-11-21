class DrugPrice < ActiveRecord::Base
  validates :price, presence: {message: "Provide drug price"}
  validates :unit_id, presence: {message: "Select measure unit"}

  belongs_to :drug_master, class_name: "DrugMaster", foreign_key: :drug_id
  belongs_to :measure_unit, class_name: "MeasureUnit", foreign_key: :unit_id
end
