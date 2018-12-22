class TransactionsController < ApplicationController
  def index
    @transaction = Transaction.all
  end

  def new
    if logged_in?
      @transaction = Transaction.new
      @coin = Coin.new
    else
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      @transaction =  current_user.transactions.create(params_transactions)
      if @transaction.save
        redirect_to user_transaction_path(@transaction.user_id, @transaction.id)
      else
        redirect_to new_user_transactions_path(@transaction.user_id)
      end
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @transaction = current_user.transactions.find_by(id: params[:id])
      @coin = current_user.coins.find_by(id: params[:id])
      @wallet = current_user.wallets.find_by(id: params[:id])
    else
      redirect_to login_path
    end
  end

  private

  def params_transactions
    params.require(:transaction).permit(:holding, :market_value, :net_cost, coin_attributes:[:name, :price])
  end
end
