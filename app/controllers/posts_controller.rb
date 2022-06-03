class PostsController < ApplicationController
  before_action :check_user, only: [:create]

  def index
    if logged_in?
      @posts = Post.all
      @posts.paginate(page: params[:page], per_page: 4)
    else
      redirect_to login_path
    end
  end

  def show
    @post = Post.where(id: params[:id]).first
    @posts.paginate(page: params[:page], per_page: 4)
  end

  def create
    @post = current_user.posts.new(post_params)
    #@post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user)
      #flash[:success] = "User created successfully!"
    else
      @user = current_user
      @posts = @user.posts.paginate(page: params[:page], per_page: 4)
      render "users/show", status: 422
    end
  end

  def edit
    @post = Post.find(params[:id])
    if current_user != @post.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to user_path(current_user)
    else
      render "posts/edit", status: 422
    end
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
