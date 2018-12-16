class Coin < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :transactions
  has_many :wallets
  has_many :users, through: :transactions
  # accepts_nested_attributes_for :transactions
  #provides getter and setter method wallets_attributes
end
