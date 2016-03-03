require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  def setup
    @contact       = contacts(:one)
    @other_contact = contacts(:two)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should save valid contact" do
    assert_equal true, @contact.save
  end

end
