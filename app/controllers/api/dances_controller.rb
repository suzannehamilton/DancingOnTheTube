class Api::DancesController < ApplicationController
  respond_to :json

  def index
    respond_with Dance.all
  end
end