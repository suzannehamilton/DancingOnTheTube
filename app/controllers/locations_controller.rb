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

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(post_params)
      redirect_to action: :index, :notice => "Location updated"
    else
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end
