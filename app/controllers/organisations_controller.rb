class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
  end

  def new
      @organisation = Organisation.new
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])

    @organisation.update(post_params)
    redirect_to action: :index
  end

  def create
    @organisation = Organisation.new(post_params)

    if @organisation.save
      redirect_to action: :index, :notice => "New organisation created"
    else
      render 'new'
    end
  end

  private
    def post_params
      params.require(:organisation).permit(:name, :url)
    end
end
