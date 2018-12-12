class Wallet < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :coin, optional: true
end
