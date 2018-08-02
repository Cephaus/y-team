class UsersController < ApplicationController

  before_action :require_user, only: [:show]
  def index

  end

  def create
    @user = User.new(user_params)
    session[:user_id] = @user.id
    @user.role = 0
    @user.enabled = 1
    @user.save
  
    # Create a profile for user
    profile = Profile.new
    profile.image_uri = "https://i.stack.imgur.com/dr5qp.jpg"
    profile.user_id = @user.id
    profile.save
    
    # flash[:success] = "Welcome to GNV Xplorer"
    redirect_to new_place_path
  end
  
  def show
    before_action :require_user, only: [:show]
    @user = User.find(params[:id])
    @users = User.all
  end

  def new
  end

  private
  def user_params
    params.require(:user).permit(:uname, :password, :email)
  end
end
