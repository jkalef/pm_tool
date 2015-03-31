class Task < ActiveRecord::Base

	#VALIDATIONS--------------------------------
	validates :title, presence: true,
	                  uniqueness: true

	validates :due_date, presence: true

	#------------------------------------------


end
