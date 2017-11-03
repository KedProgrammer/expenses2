class Api::V1::ExpensesController < ApplicationController
	 protect_from_forgery with: :null_session
	def index
    render json: Expense.all
  end


  def create
  		expense = Expense.new(expense_params)
  	if expense.save 
  		category = Categorye.find(params["expense"]["categorye_id"])
  		type = Type.find(params["expense"]["type_id"])
  		category.expenses << expense
  		type.expenses << expense
   		render json: expense, status: 201
   	else
   		render json: {errors: expense.errors}, status: 422
  	end
  end


 def update
    expense = Expense.find(params[:id])
    if expense.update_attributes(expense_params)
    render json: expense, status: 200
    else
    render json: {errors: expense.errors}, status: 422
    end
  end



  def destroy
    Expense.find(params[:id]).destroy
    head 204
  end




def expense_params
 	params.require(:expense).permit(:amount,:date,:concept,:type_id, :categorye_id)
  end
end