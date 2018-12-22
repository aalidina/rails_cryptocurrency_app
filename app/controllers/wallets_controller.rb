class WalletsController < ApplicationController
  def index
    @wallets = current_user.wallets.all
  end

  def new
    if logged_in?
      @wallet = Wallet.new(user_id: params[:user_id])
    else
      redirect_to login_path
    end
  end

  def create
    @wallet =  current_user.wallets.create(wallet_params)
    if @wallet.save
    redirect_to @wallet # redirect to wallets/:id
    else
      flash[:notice] = "Wallet name is required"
      redirect_to '/wallets/new'
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
    params.require(:wallet).permit(:name, :user_id)
  end

end
