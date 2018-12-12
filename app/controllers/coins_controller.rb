class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end

  def new
    if logged_in?
      @coin = Coin.new
      @wallet = Wallet.new
    else
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      @coin =  current_user.coins.create(params_coin)
      if @coin.save
        redirect_to coin_path(@coin)
      else
        render "new"
      end
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @wallet = current_user.wallets.find_by(id: params[:id])
      @coin = current_user.coins.find_by(id: params[:id])
    else
      redirect_to login_path
    end
  end

  private

  def params_coin
    params.require(:coin).permit(:name, :price, wallets_attributes:[:name, :holding, :market_value, :net_cost, :coin_id, :user_id])
  end
end
