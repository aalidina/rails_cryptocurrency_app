class Admin < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :string, default: false
  end
end
