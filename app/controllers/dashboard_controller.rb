class DashboardController < ApplicationController
  def index
    @tab = :dashboard
     respond_to do |format|
      format.html
      format.js
    end 
  end
end
