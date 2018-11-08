class Coin < ApplicationRecord
  has_many :wallets
  accepts_nested_attributes_for :wallets
end
