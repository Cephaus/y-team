class PlaceCommentsController < ApplicationController
  before_action :require_user, only: [:new,:create]

  def index
    @place_comments = PlaceComment.all
  end

  def new
    @place_comment = PlaceComment.new
  end

  def create
    @place_comment = PlaceComment.new(user_params)
    @place_comment.place_id = params[:place_id] 
    @place_comment.user_id = session[:user_id]

    # hardcoded ouch EH
    @place_comment.rating = 5
    @place_comment.flagged = 0
    @place_comment.enabled = 1
    @place_comment.save!
    redirect_to place_path(:id => @place_comment.place_id)
  end

  private
    def user_params
      params.require(:place_comment).permit(:title, :text, :rating)
    end
end
