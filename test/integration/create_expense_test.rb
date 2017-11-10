
require 'test_helper'


class CreateExpenseTest < ActionDispatch::IntegrationTest
	 setup do
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end
 	test "creating_expense" do
 			visit expenses_path
 			
 			
 					
 	end
end