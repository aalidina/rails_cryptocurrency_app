Build a appointment schedule

model

User
  has_many :wallets
  has_many :coin, :through => :wallets

coin
belongs_to :wallet


wallet (join table)
has_many :coin
belongs_to :user

transaction (join table)
has_many :coin
belongs_to :user

wallet
-name

transaction
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

@ user in form_for allows Rails to infer that the action of the form should be to POST to the URL /users

Since sessions does not have model we cannot use @ user so that is why we provide a specific route in the signin form.

Login page post the params to sessions/create based on the /login route which looks for the user and makes sure that the username and password are correct.  

To create a new wallet creating a coin and user was required so to do this I had to create a getter and setter method in wallet model and then use the getter method in the strong params and in new wallet erb form. We call these in-memory attributes "virtuals".
