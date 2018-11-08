class Wallet < ApplicationRecord
  belongs_to :user
  belongs_to :coin, optional: true

  #
  # def coin_attributes=(name)
  #   self.coin = Coin.find_or_create_by(name: name)
  # end
  #
  # def coin_attributes
  #   self.coin ? self.coin.name : nil
  # end

  # def coin_price=(price)
  #   self.coin = Coin.find_or_create_by(price: price)
  # end
  #
  # def coin_price
  #   self.coin ? self.coin.price : nil
  # end
end
