Build a appointment schedule

model

User
  has_many :wallets
  has_many :coin, :through => :wallets

coin
belongs_to :wallet


wallets (join table)
has_many :coin
belongs_to :user

wallet
-name
-holding
-market_value
-net_cost
-coin_id
-user_id

coin
-name
-price
-wallet_id

User
-email
-password
-username
