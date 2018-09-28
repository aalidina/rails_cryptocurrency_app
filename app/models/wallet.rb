class Wallet < ApplicationRecord
  has_many :coin
  belongs_to :user
end
