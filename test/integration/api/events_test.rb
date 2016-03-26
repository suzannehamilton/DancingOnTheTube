require "test_helper"

class EventsTest < ActionDispatch::IntegrationTest
  def test_get_all_events_is_empty_by_default
    get "/api/events", {}, { "Accept" => "application/json" }
    assert_equal 200, status

    body = JSON.parse(response.body)
    event_organisations = body.map { |d| d["name"]}

    assert_equal [], event_organisations
  end

  def test_get_all_events_for_today
    today = Date.today

    event1 = create(:event_recurring_today)
    event2 = create(:event_recurring_today)
    past_event = create(:event_recurring_yesterday)
    future_event = create(:event_recurring_tomorrow)

    get "/api/events", {}, { "Accept" => "application/json" }
    assert_equal 200, status

    body = JSON.parse(response.body)
    event_organisations = body.map { |d| d["name"]}

    assert event_organisations.include? event1.name
    assert event_organisations.include? event2.name
    refute event_organisations.include? past_event.name
    refute event_organisations.include? future_event.name

    assert_equal 2, body.length
  end
end