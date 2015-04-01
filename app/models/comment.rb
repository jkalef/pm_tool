class Comment < ActiveRecord::Base

	#--ASSOCIATIONS--------------------------
	belongs_to :discussion


	#VALIDATIONS-----------------------------
	validates :comment, presence: true

	#-----------------------------------------

end
