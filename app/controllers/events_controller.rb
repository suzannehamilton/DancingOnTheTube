class EventsController < ApplicationController
  def new
  end

  def create
    @event = Event.new(post_params)
    @event.save
    redirect_to action: :index, controller: :organisations
  end

  private
  def post_params
    params.require(:event).permit(:name, :start_date)
  end
end
