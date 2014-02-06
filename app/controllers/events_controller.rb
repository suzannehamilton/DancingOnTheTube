class EventsController < ApplicationController
  def new
  end

  def create
    @event = Event.new(post_params)
    if @event.save
      redirect_to action: :index, controller: :organisations
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:event).permit(:name, :start_date)
  end
end
