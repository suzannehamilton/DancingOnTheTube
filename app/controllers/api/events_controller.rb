class Api::EventsController < ApplicationController
  respond_to :json

  def index
    events = Event
      .joins(:weekly_recurrence)
      .where(weekly_recurrences: { day_of_week: Date.today.wday })
    respond_with events.map{ |e| EventView.new(e) }
  end
end
