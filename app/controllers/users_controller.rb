class UsersController < ApplicationController
    def index
        # variabila cu @ este vazuta si in afara functiei   
        @users = User.all
    end
    def show
        @user = User.where(id: params[:id]).first
    end
end
