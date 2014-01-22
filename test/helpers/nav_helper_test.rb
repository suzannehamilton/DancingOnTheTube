require 'test_helper'

class NavHelperTest < ActionView::TestCase
  attr_reader :request

  test "generates nav tab" do
    assert_equal('<li><a href="/">Home</a></li>', nav_link('Home', root_path))
  end

  test "tab for current page is active" do
    def self.current_page?(path)
      true
    end

    assert_equal('<li class="active"><a href="/">Home</a></li>', nav_link('Home', root_path))
  end
end
