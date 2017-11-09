require 'test_helper'

class CreateExpenseTest < ActionDispatch::IntegrationTest
 	test "creating_expense" do
 			get expenses_path
  			get new_expense_path, xhr: true
  		
  			assert_select 'div.modal-body'			
 	end
end
