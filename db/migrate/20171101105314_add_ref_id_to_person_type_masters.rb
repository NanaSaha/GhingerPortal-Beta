class AddRefIdToPersonTypeMasters < ActiveRecord::Migration
  def change
    add_column :person_type_masters, :ref_id, :string
  end
end
