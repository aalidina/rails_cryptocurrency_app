class Transaction < ApplicationRecord
  validates :holding, presence: true
  validates :market_value, presence: true
  validates :net_cost, presence: true
  belongs_to :coin, optional: true
  belongs_to :user
  accepts_nested_attributes_for :coin
end
