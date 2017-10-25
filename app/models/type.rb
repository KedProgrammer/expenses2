class Type < ApplicationRecord
	has_many :expenses, as: :imageable 
end
