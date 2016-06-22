class AccountsController < ApplicationController
  before_action :logged_in_user
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :admin_user

  def index
    @accounts = Account.all
  end

  def show
    @likes = Like.where(account_id: params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to account_path(@account.id)
    else
      render 'edit'
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private

    def account_params
      params[:account].permit(:name, :address, :country, :postal_code, :announce)
    end

    def set_account
      @account =  Account.find(params[:id])
    end

end
