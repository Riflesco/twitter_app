class SessionsController < ApplicationController
  before_action :check_login, only: [:new]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params["password"])
      log_in(user)
      redirect_to user_path(user)
    else
      flash.now[:error] = "Invalid credentials"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def check_login
    if logged_in?
      redirect_to current_user
    end
  end
end
