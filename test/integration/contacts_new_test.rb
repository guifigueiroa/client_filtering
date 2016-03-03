require 'test_helper'

class ContactsNewTest < ActionDispatch::IntegrationTest
  def setup
    @contact       = contacts(:one)
    @other_contact = contacts(:two)
  end
  
  test "new page including states" do
    get new_contact_path
    assert_template 'contacts/new'
    assert_select 'select', count: 1
    assert_select 'option', count: 27
  end
  
  test "contact creation" do
    get contacts_path
    assert_difference 'Contact.count', 1 do
      post_via_redirect contacts_path, contact: { name:  "Example User",
                                            email: "user@example.com",
                                            age:    23,
                                            state: "SP",
                                            role: "Example role" }
    end
    assert_template 'contacts/index'
    assert_not flash.empty?
  end
end
