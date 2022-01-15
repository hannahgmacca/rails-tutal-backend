class Review < ApplicationRecord
	belongs_to :tutor
	belongs_to :student
end