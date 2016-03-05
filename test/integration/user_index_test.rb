require 'test_helper'

class UserIndexTest < ActionDispatch::IntegrationTest
  test "index including pagination" do
    get contacts_path
    assert_template 'contacts/index'
    assert_select 'div.pagination'
  end
end
