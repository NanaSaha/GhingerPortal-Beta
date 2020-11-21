class CreateRequestCategories < ActiveRecord::Migration
  def change
    create_table :request_categories do |t|
      t.string :category
      t.string :ref_id

      t.timestamps null: false
    end
  end
end
