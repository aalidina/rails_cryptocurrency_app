class CoinsController < ApplicationController

  def new
    if logged_in?
      @coin = current_user.coins.new
      @coin.wallets.build(holding: "holding", market_value: "market_value", net_cost: "net_cost")
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
        binding.pry
        render "/coins/new"
      end
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @wallet = current_user.wallets.find(id: params[:id])
      @coin = current_user.coins.find(id: params[:id])
    else
      redirect_to login_path
    end
  end

  private

  def params_coin
    params.require(:coin).permit(:name, :price, wallets_attributes:[:name, :holding, :market_value, :net_cost])
  end
end
