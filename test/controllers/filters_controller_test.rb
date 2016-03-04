require 'test_helper'

class FiltersControllerTest < ActionController::TestCase
  def setup
    @filter = filters(:one)
  end
  
  test "should get new" do
    get :new, contact: @filter.attributes
    assert_response :success
  end

end
