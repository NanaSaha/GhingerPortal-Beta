class ChangePriceInDrugPrices < ActiveRecord::Migration
  def change
    change_column :drug_prices, :price, :decimal, precision: 10, scale: 2
  end
end
