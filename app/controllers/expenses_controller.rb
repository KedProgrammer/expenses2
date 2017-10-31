class ExpensesController < ApplicationController
before_action :filter, :months,  only: :index

  def index
    @tab = :expenses
     @categories = Categorye.all
    @types = Type.all
    respond_to do |format|
      format.html
      format.js
    end 
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
  		 @expenses = Expense.order("date DESC")
  		category = Categorye.find(params[:Category])
  		type = Type.find(params[:Type])
  		category.expenses << @expense
  		type.expenses << @expense
  	end
  end


  def filter
    today = Date.today
     if params["type"] and params["category"] and params["date"]
      @expenses = Expense.order("date DESC").where("type_id = ? AND categorye_id = ? AND date=?", params["type"], params["category"], Date.parse(params["date"]).mon)
    elsif params["type"] or  params["category"] or params["date"] 
       @expenses = Expense.order("date DESC").where("type_id = ? OR categorye_id = ? OR date=?", params["type"], params["category"], Date.parse(params["date"]).mon)
    else
       @expenses = Expense.order("date DESC").where("date = ?", today.mon)
    end
  end

  def months
    today = Date.today
    @months = Array.new
    12.times do |m|
      @months[m] = today - m*31
    end
  end




  def expense_params
 	params.require(:expense).permit(:amount,:date,:concept,:type, :category)
  end



end
