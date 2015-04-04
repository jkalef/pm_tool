class TaskCommentsController < ApplicationController


	#--ACTIONS--------------------------------------
	def create
		@task_comment = TaskComment.new(task_comment_params)
		@task = Task.find(params[:task_id])
		@task_comment.task = @task
		if @task_comment.save
			redirect_to task_path(@task)
		else
			render text: "Where do I go??"
		end
	end

	#--CLASS METHODS----------------------------------
	private

	def task_comment_params
		params.require(:task_comment).permit(:body)
	end

end
