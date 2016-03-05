require 'test_helper'

class FilteringTest < ActionDispatch::IntegrationTest
  def setup
    @contact       = contacts(:one)
    @other_contact = contacts(:two)
    @filter = filters(:one)
    @contact.save
    @other_contact.save
  end
  
  test "applying filters" do
    get contacts_path
    assert_template 'contacts/index'
    get_via_redirect filters_path, { filter:  {filter_name: "Filtro1",
                                                age_to: 19,
                                                age_from: 21,
                                                op_state: "AND",
                                                state: "SP",
                                                op_role: "AND",
                                                role: "Developer"}, commit: I18n.t(:apply) }
    assert_template 'contacts/index'
  end
  
  test "creating new filter" do
    get contacts_path
    assert_template 'contacts/index'
    assert_difference 'Filter.count', 1 do
      post_via_redirect filters_path, { filter: {filter_name: "Filtro1",
                                                age_to: 19,
                                                age_from: 21,
                                                op_state: "AND",
                                                state: "SP",
                                                op_role: "AND",
                                                role: "Developer"}, commit: I18n.t(:save_filter) }
    end
    assert_not flash.empty?
  end
end
