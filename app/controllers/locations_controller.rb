class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(post_params)

    if @location.save
      redirect_to action: :index, :notice => "New location created"
    else
      render 'new'
    end
  end

  private
    def post_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end
