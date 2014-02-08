class EventsController < ApplicationController
  def new
    @event = Event.new
    @organisation = Organisation.find(params[:organisation_id])
  end

  def create
    @event = Event.new(post_params)
    @event.organisation = Organisation.find(params[:organisation_id])
    if @event.save
      redirect_to action: :index,
        controller: :organisations,
        notice: "New event created for organisation: " + Organisation.find(params[:organisation_id]).name
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:event).permit(:name, :start_date, :organisation_id)
  end
end
