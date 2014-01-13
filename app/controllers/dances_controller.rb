class DancesController < ApplicationController
  def new
  end

  def create
    render text: params[:dance].inspect
  end
end
