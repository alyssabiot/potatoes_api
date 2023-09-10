class CreateMarketPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :market_prices do |t|
      t.decimal :value, precision: 6, scale: 2
      t.datetime :time

      t.timestamps
    end
  end
end
