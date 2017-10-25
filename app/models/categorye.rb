class Categorye < ApplicationRecord
	has_many :expenses, as: :imageable
end
