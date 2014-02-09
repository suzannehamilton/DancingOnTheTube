class EventsController < ApplicationController
  def new
    @event = Event.new
    @organisation = Organisation.find(params[:organisation_id])
  end

  def create
    @event = Event.new(post_params)
    @organisation = Organisation.find(params[:organisation_id])
    @event.organisation = @organisation

    if @event.save
      redirect_to action: :index,
        controller: :organisations,
        notice: "New event created for organisation: " + @organisation.name
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(post_params)
      redirect_to action: :index,
        controller: :organisations
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:event).permit(:name, :start_date, :organisation_id)
  end
end
