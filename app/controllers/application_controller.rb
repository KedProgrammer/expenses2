class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'date'
  include  ExpensesHelper
  include DashboardHelper
 
  protect_from_forgery with: :exception

end
