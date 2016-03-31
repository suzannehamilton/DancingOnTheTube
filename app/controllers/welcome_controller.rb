class WelcomeController < ApplicationController
  def index
    individual_events = Event.all

    @events = EventsView.new(individual_events)
  end
end
