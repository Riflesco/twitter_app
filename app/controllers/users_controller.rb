class UsersController < ApplicationController
    def index
        # o variabila fara @ este vizibila doar in functie
        # o variabila cu @ este vizibila si in afara functiei
        @users = User.all
    end
    def show
        @user = User.where(id: params[:id]).first
        if @user.nil?
            redirect_to '/users/'
        end   
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(name: params['user']['name'],email: params['user']['email'],age: params['user']['age'],gender: params['user']['gender'],phone_number: params['user']['phone_number'])
  
        if user.save
          redirect_to "/users/#{user.id}"
          flash[:success] = 'User created successfully!'
        else
          flash[:error] = user.errors.full_messages
          redirect_to '/users/new'
        end
      end
end
