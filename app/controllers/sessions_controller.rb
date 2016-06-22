class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params["session"][])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.admin == true
        redirect_back_or accounts_path
      else
        redirect_back_or tasks_path(user.account.id)
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

end
