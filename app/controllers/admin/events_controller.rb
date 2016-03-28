class Admin::EventsController < Admin::AdminController
  def new
    @event = Event.new
    @event.organisation = Organisation.find(params[:organisation_id])
    @weekly_recurrence = @event.build_weekly_recurrence
  end

  def create
    @event = Event.new(post_params)

    organisation_id = params[:organisation_id]
    @organisation = Organisation.find(organisation_id)
    @event.organisation = @organisation

    if @event.save
      redirect_to edit_admin_organisation_path(organisation_id, notice: "New event created: " + @event.name)
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
      redirect_to edit_admin_organisation_path(@event.organisation, notice: "Event updated: " + @event.name)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to edit_admin_organisation_path(params[:organisation_id], :notice => "Deleted event: " + @event.name)
  end

  private
  def post_params
    params.require(:event).permit(:name, :organisation_id, :location_id, :weekly_recurrence_attributes => [:id, :day_of_week])
  end
end
