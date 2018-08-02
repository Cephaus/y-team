class SessionsController < ApplicationController

  def create
    @user = User.find_by_uname(params[:session][:uname])
    if @user.password == params[:session][:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Your email or password does not match"
      redirect_to sessions_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
