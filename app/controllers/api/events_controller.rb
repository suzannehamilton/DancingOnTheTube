class Api::EventsController < ApplicationController
  respond_to :json

  def index
    events = Event.today
    respond_with events.map{ |e| EventView.new(e) }
  end
end
