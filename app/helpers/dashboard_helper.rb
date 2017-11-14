module DashboardHelper
	def my_month
		total_month = Array.new
		types = Type.all
		date = Date.today 
		days = date.mday 
		year = date.year
		month = date.mon
		types.each do |c|
			total_month[c.id - 1] = {}
			total_month[c.id - 1]["type"] = c.name
			total_month[c.id - 1]["days"] = []
			days.times do |d|
				sum = 0
				aux = Expense.where("type_id = ? AND extract(day from date) = ?  AND extract(month from date) = ? AND extract(year from date) = ?  ", c.id, d+1 , month , year )
				if !aux.any?
					total_month[c.id - 1]["days"][d] = {"day" => "0#{d + 1}" , "amount" => sum}
				else
					aux.each do |a|
					sum += a.amount
					end
					total_month[c.id - 1]["days"][d] = {"day" => "0#{d + 1}" , "amount" => sum}
				end	
			end
		end
		total_month
	end


	def my_months
		total_months = Array.new
		types = Type.all
		date = Date.today 
		days = date.mday 
		year = date.year
		month = date.mon
		types.each do |c|
			total_months[c.id - 1] = {}
			total_months[c.id - 1]["type"] = c.name
			total_months[c.id - 1]["months"] = []
			6.times do |d|
				date = Date.today
				sum = 0
				aux = Expense.where("type_id = ?  AND extract(month from date) = ? AND extract(year from date) = ?  ", c.id , month - d , year )
				if !aux.any?
					date = date - d*29
					total_months[c.id - 1]["months"][d] = {"month" => "#{date.strftime('%b')}"  , "amount" => sum}
				else
					aux.each do |a|
					sum += a.amount
					end
					date = date - d*29
					total_months[c.id - 1]["months"][d] = {"month" => "#{date.strftime('%b')}" , "amount" => sum}
				end	
			end
		end
	
		total_months
	end

	def my_categorys
		total_categorys = Array.new
		categorys = Categorye.all
		date = Date.today 
		days = date.mday 
		year = date.year
		month = date.mon
		categorys.each do |c|
			total_categorys[c.id - 1] = {}
			total_categorys[c.id - 1]["category"] = c.name
			total_categorys[c.id - 1]["amount"] = 0
				sum = 0
				aux = Expense.where("categorye_id = ? ", c.id )
				if !aux.any?
					total_categorys[c.id - 1]["amount"] = 0
				else
					aux.each do |a|
					sum += a.amount
					end
					total_categorys[c.id - 1]["amount"] = sum
				end	
		end

		total_categorys
	end

	def two_months
 	total_acumulate = Array.new
		types = Type.all
		date = Date.today 
		days = date.mday 
		year = date.year
		month = date.mon
		2.times do |m|
			date = Date.today
			days = date.mday 
			date = date - m*days
			days = date.mday
		
			
			month = date.mon
			total_acumulate[m] = {}
			total_acumulate[m]["type"] = "#{date.strftime('%b')}"
			total_acumulate[m]["days"] = []
			days.times do |d |
				sum = 0
				aux = Expense.where(" extract(day from date) = ?  AND extract(month from date) = ? AND extract(year from date) = ?  ", d+1 , month , year )
				
				if !aux.any?
					total_acumulate[m]["days"][d] = {"day" => d + 1, "amount" => 0}
				else
					aux.each do |a|
					sum += a.amount
					end
				end
					total_acumulate[m]["days"][d] = {"day" => d + 1 , "amount" => sum}
			end	
		end
	
		total_acumulate
 	end


 	def get_data
 		acumulates = {}
 		acumulates["day"] = sum(Expense.where("extract(day from date) = ? AND extract(month from date) = ? AND extract(year from date) = ?  ", Date.today.mday , Date.today.mon , Date.today.year ))
 		acumulates["last-day"] = sum(Expense.where("extract(day from date) = ? AND extract(month from date) = ? AND extract(year from date) = ?  ", Date.today.mday - 1 , Date.today.mon , Date.today.year ))
 		acumulates["this-month"] = sum(Expense.where("extract(month from date) = ? AND extract(year from date) = ?  ", Date.today.mon , Date.today.year ))
 		acumulates["last-month"] = sum(Expense.where("extract(month from date) = ? AND extract(year from date) = ? ", Date.today.mon  - 1, Date.today.year ))
 		acumulates
 		
 	end

 	def sum(array)
 		sum = 0
 		array.each do |a|
			sum += a.amount
		end	
		sum
 	end
 
end
