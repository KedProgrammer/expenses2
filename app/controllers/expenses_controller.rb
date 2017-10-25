class ExpensesController < ApplicationController
	
  def index
    @tab = :expenses
    @expenses = Expense.all
  end


  def new
  	@expense = Expense.new
  	@categories = Categorye.all
  	@types = Type.all
  	@today = Date.today
  	respond_to do |format|
		    format.html
		    format.js
  		end
  	
  end


  def create
  	@expense = Expense.new(expense_params)
  	if @expense.save 
  		respond_to do |format|
		    format.html
		    format.js
  		end
  	end
  end

  def expense_params
 	params.require(:expense).permit(:amount,:date,:concept,:category, :type)
  end
end
