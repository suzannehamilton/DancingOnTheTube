require 'test_helper'

class NavHelperTest < ActionView::TestCase
  test "generates nav tab" do
    assert_equal('<li><a href="/">Home</a></li>', nav_link('Home', root_path))
  end
end
