class ApplicationController < ActionController::Base
  include SessionsHelper

  def heloblabla
    if logged_in?
      redirect_to users_path
    else
      redirect_to login_path
    end
  end

  def alta_ruta
    # render html: 'Ai intrat pe alta ruta!'
  end

  def create_user
    #user = User.create(name: params[:bla]);
    # render html: "Userul cu id: #{user.id} a fost creat"
    #render html: "Pagina create user"
  end

  def main_menu
  end

  def statistics
    redirect_to(root_url) unless logged_in? && is_admin
  end

  def check_user
    if !logged_in?
      redirect_to login_path
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
