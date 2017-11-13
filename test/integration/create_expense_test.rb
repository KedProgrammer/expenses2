
require 'test_helper'


class CreateExpenseTest < ActionDispatch::IntegrationTest
	 setup do
   
    Capybara.current_driver = Capybara.javascript_driver
  end

 	test "invalid creating_expense" do
 			visit expenses_path
 			click_link('New Expense')
 			fill_in('expense[concept]', with: 'prueba')
 			click_button('New Expense')
 			fill_in('expense[amount]', with: 'no int')
 			click_button('New Expense')
 			
 	end



 		test "valid creating_expense" do
 			visit expenses_path
 			click_link('New Expense')
 			fill_in('expense[concept]', with: 'prueba')
 			fill_in('expense[amount]', with: 20000)
 			click_button('New Expense')
 			
 	end
end