class ProfilesController < ApplicationController
  def show
    # return unless session[:user_id]
    # @current_user ||= User.find(session[:user_id])
    # @user = User.find(session[:user_id])
    # puts @user
    # puts "---------"
    @profile = Profile.find_by(user_id:(session[:user_id]))
    @user = User.find(session[:user_id])
  end

  def index
    redirect_to action: 'show', id: (session[:user_id])
  end

  def update
    @profile = Profile.find_by(user_id:(session[:user_id]))
    if @profile.update_attributes(profile_params)
      # flash[:success] = "Profile Updated"
    else
      flash[:notice] = "Error Updating"
      render 'update'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :location, :image_uri)
  end

end