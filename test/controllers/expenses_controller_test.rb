require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest


	test "should get expenses" do
		get expenses_path
		 
		assert_not_nil assigns(:expenses)


	end


	test "should not create expense" do
		get expenses_path
		assert_no_difference 'Expense.count' do
		post expenses_path ,xhr: true, params: { expense: {
										concept: "",
										amount: "dfs",
										date: "",
										categorye_id: "",
										type_id: "" }}
		end
 	




	end

	test "should reate expense" do
		assert_difference 'Expense.count', 1 do
		post expenses_path ,xhr: true, params: { expense: {
										concept: "prueba",
										amount: 5000,
										date: "2017-11-03",
										categorye_id: 1,
										type_id: 1 }}
		end
	end



end
