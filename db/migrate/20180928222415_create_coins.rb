class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.integer :price
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
