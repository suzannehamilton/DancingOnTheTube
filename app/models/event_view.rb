class EventView
  attr_reader :name

  def initialize(event)
    @name = event.name
  end
end