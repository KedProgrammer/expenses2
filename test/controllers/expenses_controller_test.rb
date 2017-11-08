require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

	setup do 
	@expense = expenses(:one)
	@expense_invalid = expenses(:two)	
 	end

test "should get articles" do
	get expenses_path
	assert_not_nil assigns(:expenses)

end



end
