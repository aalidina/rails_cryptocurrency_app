class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
  end

  def new
    if logged_in?
      @wallet = current_user.wallets.new
    else
      redirect_to login_path
    end
  end

  def create
    @wallet =  current_user.wallets.create(wallet_params)
    binding.pry
    if @wallet.save
      redirect_to wallet_path(@wallet)
    else
      render "/wallets/new"
    end
  end

  def show
    if logged_in?
      @wallet = current_user.wallets.find_by(id: params[:id])
    else
      redirect_to login_path
    end
  end

  private

  def set_wallet
    @wallet = Wallet.find_by(id: params[:id])
  end

  def wallet_params
    params.require(:wallet).permit(:name)
  end

end
