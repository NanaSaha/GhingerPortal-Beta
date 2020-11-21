class CreatePaymentReqs < ActiveRecord::Migration
  def change
    create_table :payment_reqs do |t|
      t.integer :billing_info_id
      t.decimal :amount, precision: 10, scale: 2
      t.string :reference
      t.string :exttrid
      t.string :mobile_number
      t.string :nw
      t.text :callback_url

      t.timestamps null: false
    end
  end
end
