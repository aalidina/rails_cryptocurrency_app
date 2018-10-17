class CreateMarketPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :market_places do |t|
      t.string :coin_id
      t.string :wallet_id
      t.decimal :coin_price
      t.decimal :quantity
      t.timestamps
    end
  end
end
