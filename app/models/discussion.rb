class Discussion < ActiveRecord::Base

	#VALIDATIONS-------------------------
	validates :title, :description, presence: true


	#------------------------------------


end
