class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  has_many :transactions
  has_many :wallets
  has_many :coins, through: :transactions #transactions is the join table
end
