class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.string :name
      t.integer :holding
      t.integer :market_value
      t.integer :net_cost
      t.integer :coin_id
      t.integer :user_id

      t.timestamps
    end
  end
end
