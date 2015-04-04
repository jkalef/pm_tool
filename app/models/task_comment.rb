class TaskComment < ActiveRecord::Base
	
	belongs_to :task

	#--VALIDATIONS--------------------------------------
	validates :body, presence: true


end
