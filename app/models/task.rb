class Task < ActiveRecord::Base


	#VALIDATIONS--------------------------------
	validates :title, presence: true,
	                  uniqueness: true

	validates :due_date, presence: true


	#-ASSOCIATIONS------------------------------
	belongs_to :project
	has_many :task_comments


	#--CALLBACKS---------------------------------
	after_initialize :set_defaults


	#--CLASS METHODS------------------------------
	def set_defaults
		self.status ||= "incomplete"
	end




end
