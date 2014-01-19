class DancesController < ApplicationController
  def index
    @dances = Dance.all
  end

  def new
    @dance = Dance.new
  end

  def create
    @dance = Dance.new(post_params)

    if @dance.save
      redirect_to action: :index, :notice => "New dance created"
    else
      render 'new'
    end
  end

  def update
    @dance = Dance.find(params[:id])

    if @dance.update(post_params)
      redirect_to action: :index, :notice => "Dance updated"
    else
      render 'edit'
    end
  end

  def edit
    @dance = Dance.find(params[:id])
  end

  def destroy
    @dance = Dance.find(params[:id])

    redirect_to action: :index, :notice => "Dance deleted"
  end

  private
    def post_params
      params.require(:dance).permit(:name)
    end
end
