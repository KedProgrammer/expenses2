class DashboardController < ApplicationController
  def index
  	@categorys_by_day = my_month
    @categorys_by_months = my_months
    @total_categorys = my_categorys
    @acumulate = two_months
    @tab = :dashboard
     respond_to do |format|
      format.html
      format.js
    end 
  
  end
end
