class PlacesController < ApplicationController
  before_action :require_user, only: [:new]
  #list all places
  def index
    @places = Place.all
  end

  def new
    @categories = Category.where(cat_type: 'Place')
  end

  #create place
  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to @place
  end

  #show single
  def show
    @place_comment = PlaceComment.new
    # only last 5 EH
    @place_comments = PlaceComment.order(id: :desc).limit(6)
    @place = Place.find(params[:id])
    @category = Category.find(@place.cat_id)
    @profiles = Profile.all
    @users = User.all
  end

  private
    def place_params
      params.require(:place).permit(:name, :lat, :lng, :image_uri, :description, :cat_id, :address)
    end
end
