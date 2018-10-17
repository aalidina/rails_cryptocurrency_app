class Coin < ApplicationRecord
  has_many :wallets
  has_many :users, through: :wallets
end
