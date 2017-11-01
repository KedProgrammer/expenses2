module ExpensesHelper


	def get_dates(expenses)
		if expenses.length == 0
			dates = {'total' => 0 , 'average' => 0, 'transactions' => 0}
			dates
		else
			total = 0
			expenses.each do |e|
				total += e.amount
			end
			dates = {'total' => total , 'average' => total/expenses.length, 'transactions' => expenses.length}
			dates
		end
	end



	def save_params(params)
		session[:params] = params
	end


	def get_params
	 session[:params]
	end
end
