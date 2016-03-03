require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact       = contacts(:one)
    @other_contact = contacts(:two)
  end
  
  test "name should not be empty" do
    @contact.name = " "*5
    assert_not @contact.valid?
  end
  
  test "name should not have between 5 and 50 characters" do
    @contact.name = "a"*4
    assert_not @contact.valid?
    @contact.name = "a"*51
    assert_not @contact.valid?
  end
  
  test "age should be numeric" do
    @contact.age = "test"
    assert_not @contact.valid?
  end
  
  test "role should not have between 5 and 50 characters" do
    @contact.role = "a"*4
    assert_not @contact.valid?
    @contact.role = "a"*51
    assert_not @contact.valid?
  end
end
