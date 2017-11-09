class Expense < ApplicationRecord
	
	belongs_to :type, optional: true
	belongs_to :categorye, optional: true

	validates :amount,:concept, :date, :categorye_id, :type_id,   presence: true
	validates :amount, numericality: { only_integer:true }
	

end
