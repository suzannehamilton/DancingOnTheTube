class Api::EventsController < ApplicationController
  respond_to :json

  def index
    respond_with Event.all.map{ |e| EventView.new(e) }
  end
end
