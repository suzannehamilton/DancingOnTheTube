class DancesController < ApplicationController
  def new
  end

  def create
    @dance = Dance.new(post_params)
    @dance.save
    redirect_to @dance
  end

  def show
    @dance = Dance.find(params[:id])
  end

  private
    def post_params
      params.require(:dance).permit(:name)
    end
end
