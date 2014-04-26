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
    skip
    get "api/events", {}, { "Accept" => "application/json" }
    assert_equal 200, status

    body = JSON.parse(response.body)
    event_organisations = body.map { |d| d["name"]}

    assert event_organisations.include? events(:salsa_event).name
    assert event_organisations.include? events(:west_coast_swing_event).name
  end
end