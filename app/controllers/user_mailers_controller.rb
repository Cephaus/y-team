class UserMailersController < ApplicationController

def create
    # @event_comment.event_id = params[:event_id]
    # user_id = session[:user_id]
    @user = User.find(session[:user_id])
    @event = Event.find(params[:event_id])

    puts @event.start_time
    time_until = @event.start_time-Time.now-3600
    puts time_until
    UserMailer.welcome_email(@user).deliver_later(wait: time_until.seconds)

    flash[:success] = "You have been signed up for a reminder"
    redirect_to event_path(params[:event_id])
end

def index
end

end