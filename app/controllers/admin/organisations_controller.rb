class Admin::OrganisationsController < Admin::AdminController
  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new
  end

  def edit
    organisation_id = params[:id]
    @organisation = Organisation.find(organisation_id)
  end

  def update
    @organisation = Organisation.find(params[:id])

    if @organisation.update(post_params)
      redirect_to action: :index, :notice => "Organisation updated"
    else
      render 'edit'
    end
  end

  def create
    @organisation = Organisation.new(post_params)

    if @organisation.save
      redirect_to action: :index, :notice => "New organisation created"
    else
      render 'new'
    end
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy

    redirect_to action: :index, :notice => "Organisation deleted"
  end

  private
    def post_params
      params.require(:organisation).permit(:name, :url, :dance_ids => [], :location_ids => [])
    end
end
