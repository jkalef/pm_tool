class Comment < ActiveRecord::Base

	#--ASSOCIATIONS--------------------------
	belongs_to :discussion


	#VALIDATIONS-----------------------------
	validates :body, presence: true

	#-----------------------------------------

end
