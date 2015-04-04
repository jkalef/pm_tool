class TaskComment < ActiveRecord::Base
	
	belongs_to :task
	belongs_to :user

	#--VALIDATIONS--------------------------------------
	validates :body, presence: true


end
