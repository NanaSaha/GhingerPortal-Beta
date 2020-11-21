class CreatePrePaymentReqs < ActiveRecord::Migration
  def change
    create_table :pre_payment_reqs do |t|
      t.integer :billing_info_id
      t.decimal :amount, precision: 10, scale: 2
      t.string :reference

      t.timestamps null: false
    end
  end
end
