require "test_helper"

class EventsTest < ActionDispatch::IntegrationTest
  def test_get_all_events_is_empty_by_default
    get "api/events", {}, { "Accept" => "application/json" }
    assert_equal 200, status

    body = JSON.parse(response.body)
    event_organisations = body.map { |d| d["name"]}

    assert_equal [], event_organisations
  end

  def test_get_all_events
    event1 = create(:event)
    event2 = create(:event)

    get "api/events", {}, { "Accept" => "application/json" }
    assert_equal 200, status

    body = JSON.parse(response.body)
    event_organisations = body.map { |d| d["name"]}

    assert_equal 2, body.length

    assert event_organisations.include? event1.name
    assert event_organisations.include? event2.name
  end
end