require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
 setup do 
	@expense = expenses(:one)
	@expense_invalid = expenses(:two)	
 end
 test "should be invalid" do
 	@expense.date = ""
 	assert_not @expense.valid?

 end
 test "should be valid" do
 	assert @expense.valid?
 end


 test "amount should be numeric" do
 	invalid_amount = %w[asdffdsa 123s32 ]
 	invalid_amount.each do |amount|
 	@expense.amount = amount
 	assert_not @expense.valid? , "#{amount.inspect} should be valid"
 	end
 end


test "invalid expense" do
	
end






end
