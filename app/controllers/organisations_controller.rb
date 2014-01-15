class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
  end

  def new
  end
end
