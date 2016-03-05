require 'test_helper'

class FilterTest < ActiveSupport::TestCase
  def setup
    @filter       = filters(:one)
    @other_filter = filters(:two)
  end
  
  test "name should not be empty" do
    @filter.filter_name = " "*5
    assert_not @filter.valid?
  end
end