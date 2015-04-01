class Discussion < ActiveRecord::Base

	#--ASSOCIATIONS----------------------
	belongs_to :project
	has_many :comments, dependent: :destroy


	#VALIDATIONS-------------------------
	validates :title, :description, presence: true


	#------------------------------------


end
