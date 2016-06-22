class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :destroy]

  def index
    @users = User.all
  end

  def show
    @account = @user.account
  end

  def new
    @user = User.new
    @current_user = current_user
    @account = @current_user.account
    @accounts = Account.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @account = @current_user.account
    @accounts = Account.all
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :account_id, :picture)
    end

    # beforeフィルター

    def set_user
      @user = User.find(params[:id])
    end

    # 正しいユーザーかどうか確認
    def correct_user
      unless current_user.admin == true
        @user = User.find(params[:id])
        redirect_to(login_url) unless current_user?(@user)
        log_out unless current_user?(@user)
      end
    end

end
