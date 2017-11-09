
require 'test_helper'

class CreateExpenseTest < Capybara::Rails::TestCase
 	test "creating_expense" do
 			visit expenses_path
 			click_link('New Expense')
 			wait_for_ajax
 					
 	end
end