class User < ApplicationRecord
  has_many :wallets
  has_many :coin, through: :wallets
end
