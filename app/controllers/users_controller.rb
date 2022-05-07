class UsersController < ApplicationController
  before_action :check_user, only: [:index, :show]

  def index

    # o variabila fara @ este vizibila doar in functie
    # o variabila cu @ este vizibila si in afara functiei
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
    if @user.nil?
      redirect_to "/users/"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
      #redirect_to "/users/#{@user.id}"
      flash[:success] = "User created successfully!"
    else
      render "users/new"
      #flash[:error] = user.errors.full_messages
      #redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def check_user
    if !logged_in?
      redirect_to login_path
    end
  end
end
