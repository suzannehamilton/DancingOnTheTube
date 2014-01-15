class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
  end

  def new
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
