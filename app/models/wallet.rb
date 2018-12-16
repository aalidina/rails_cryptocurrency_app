class Wallet < ApplicationRecord
  validates :name, presence: true
  belongs_to :user, optional: true
  belongs_to :coin, optional: true
end
