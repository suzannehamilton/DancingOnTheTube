class DancesController < ApplicationController
  def index
    @dances = Dance.all
  end

  def new
  end

  def create
    @dance = Dance.new(post_params)
    @dance.save
    redirect_to action: :index, :notice => "New dance created"
  end

  def edit
    @dance = Dance.find(params[:id])
  end

  private
    def post_params
      params.require(:dance).permit(:name)
    end
end
