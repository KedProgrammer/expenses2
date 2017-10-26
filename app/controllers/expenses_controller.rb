class ExpensesController < ApplicationController

  def index
    @tab = :expenses
    @expenses = Expense.all
    @categories = Categorye.all
    @types = Type.all
    @active = params["category_id"]
    
  end


  def new
  	@expense = Expense.new
  	@categories = Categorye.all
  	@types = Type.all
  	@today = Date.today
  
  	
  end


  def create
  	
  	@expense = Expense.new(expense_params)
  	if @expense.save 
  		@expenses = Expense.all
  		category = Categorye.find(params[:Category])
  		type = Type.find(params[:Type])
  		category.expenses << @expense
  		type.expenses << @expense
  	end
  
  end

  def expense_params
 	params.require(:expense).permit(:amount,:date,:concept,:type, :category)
  end
end
