require 'test_helper'

class ContactsNewTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "new page including states" do
    get new_contact_path
    assert_template 'contacts/new'
    assert_select 'select', count: 1
    assert_select 'option', count: 27
  end
end
