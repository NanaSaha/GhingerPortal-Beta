class CreateBillingInfoBillItems < ActiveRecord::Migration
  def change
    create_table :billing_info_bill_items do |t|
      t.integer :billing_info_id
      t.integer :item_id
      t.decimal :item_price, precision: 10, scale: 2
      t.integer :quantity
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
