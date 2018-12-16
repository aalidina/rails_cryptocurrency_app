class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end

  def new
    
  end

  def create

  end

  def show

  end

  private

  def params_coin
    params.require(:coin).permit(:name, :price)
  end
end
