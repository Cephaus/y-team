class EventCommentsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def Index
    @event_comments = EventComment.all
  end

  def new
    @event_comment = EventComment.new
  end

  def create
    @event_comment = EventComment.new(user_params)
    @event_comment.event_id = params[:event_id]
    @event_comment.user_id = session[:user_id]

    # hardcoded ouch EH
    @event_comment.rating = 5
    @event_comment.flagged = 0
    @event_comment.enabled = 1
    @event_comment.save!
    redirect_to event_path(:id => @event_comment.event_id)
end

private
  def user_params   
    params.require(:event_comment).permit(:title, :text, :rating)
  end
end