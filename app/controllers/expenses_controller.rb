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
   
      @expenses = filter2
      @dates =  get_dates(@expenses)
  	end

  end


  def filter
    today = Date.today
      if params["date"]
        if params["type"] and params["category"] 
          @expenses = Expense.order("date DESC").where("type_id = ? AND categorye_id = ? AND extract(month from date)  = ? AND extract(year from date) = ?", params["type"], params["category"], Date.parse(params["date"]).mon, Date.parse(params["date"]).year)
           
          elsif params["type"] or  params["category"]
             @expenses = Expense.where("(type_id = ? OR categorye_id = ?) AND extract(month from date) = ? AND extract(year from date) = ?", params["type"], params["category"], Date.parse(params["date"]).mon, Date.parse(params["date"]).year)
              
          else
            @expenses =  Expense.where("extract(month from date) = ? AND extract(year from date) = ?", Date.parse(params["date"]).mon, Date.parse(params["date"]).year).order("date DESC")
             
        end

      else
        if params["type"] and params["category"] 
          @expenses = Expense.order("date DESC").where("type_id = ? AND categorye_id = ? AND extract(month from date) = ? AND extract(year from date) = ?", params["type"], params["category"], today.mon,today.year)
          
          elsif params["type"] or  params["category"]
             @expenses = Expense.order("date DESC").where("(type_id = ? OR categorye_id = ?) AND extract(month from date) = ? AND extract(year from date) = ?", params["type"], params["category"], today.mon,today.year)
              
          else
            @expenses =  Expense.where("extract(month from date) = ? AND extract(year from date) = ?", today.mon, today.year).order("date DESC")

          end
      end
      save_params(params)
     @dates =  get_dates(@expenses)

  end

  def filter2
    params = get_params
    today = Date.today
      if params 
        if params["date"]
          if params["type"] and params["category"] 
            @expenses = Expense.order("date DESC").where("type_id = ? AND categorye_id = ? AND extract(month from date) = ? AND extract(year from date) = ?", params["type"], params["category"], Date.parse(params["date"]).mon, Date.parse(params["date"]).year)
             
            elsif params["type"] or  params["category"]
               @expenses = Expense.where("(type_id = ? OR categorye_id = ?) AND extract(month from date) = ? AND extract(year from date) = ?", params["type"], params["category"], Date.parse(params["date"]).mon, Date.parse(params["date"]).year)
                
            else
              @expenses =  Expense.where("extract(month from date) = ? AND extract(year from date) = ?", Date.parse(params["date"]).mon, Date.parse(params["date"]).year).order("date DESC")
               
          end

        else
          if params["type"] and params["category"] 
            @expenses = Expense.order("date DESC").where("type_id = ? AND categorye_id = ? AND extract(month from date) = ? AND extract(year from date) = ?", params["type"], params["category"], today.mon,today.year)
            
            elsif params["type"] or  params["category"]
               @expenses = Expense.order("date DESC").where("(type_id = ? OR categorye_id = ?) AND extract(month from date) = ? AND extract(year from date) = ?", params["type"], params["category"], today.mon,today.year)
                
            else
              @expenses =  Expense.where("extract(month from date) = ? AND extract(year from date) = ?", today.mon, today.year).order("date DESC")

            end
        end
     @expenses
   else
    @expenses = []
  end

  end



  def edit
    @expense = Expense.find(params[:id])
    @categories = Categorye.all
    @types = Type.all
    @today = Date.today
  end




  def update
   
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
     @categories = Categorye.all
    @types = Type.all
    @today = Date.today
    @expenses = filter2
    @dates =  get_dates(@expenses)
    end
  end

  def destroy
    Expense.find(params[:id]).destroy
    @categories = Categorye.all
    @types = Type.all
    @today = Date.today
    @expenses = filter2
    @dates =  get_dates(@expenses)
  end




  def months
    today = Date.today
    @months = Array.new
    13.times do |m|
      @months[m] = today - m*29
    end
  end




  def expense_params
 	params.require(:expense).permit(:amount,:date,:concept,:type_id, :categorye_id)
  end





end
