class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
  end

  def new
    if logged_in?
      @wallet = Wallet.new
    else
      redirect_to login_path
    end
  end

  def create
    @wallet =  current_user.wallets.new(wallet_params)
    @wallet.save
    if @wallet.save
      redirect_to wallet_path(@user), notice: 'Wallet was successfully created.'
    else
      render "/wallets/new"
    end
  end

  def show
    if logged_in?
      @wallet = Wallets.find_by(user_id: params[:user_id])
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
