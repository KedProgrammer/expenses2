class Expense < ApplicationRecord
	
	belongs_to :type, optional: true
	belongs_to :categorye, optional: true

	validates :amount,:concept, :date,  presence: true
	validates :amount, numericality: { only_integer:true }
	

end
