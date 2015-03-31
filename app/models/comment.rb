class Comment < ActiveRecord::Base

	#VALIDATIONS-----------------------------
	validates :comment, presence: true

	#-----------------------------------------

end
