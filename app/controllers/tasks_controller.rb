class TasksController < ApplicationController

	#--BEFORE ACTIONS-----------------------------------------
	before_action :find_project, only: [:create, :update] 
	before_action :find_task


	#--ACTIONS------------------------------------------------
	def create
		@task = Task.new(task_params)
		@task.project = @project

		if @task.save
			redirect_to project_path(@project)
		else
			render text: "Error...didn't work!"
		end
	end


	def update
		if @task.update(task_params)
			#render text: params
			redirect_to project_path(@project)
		else
			render text: "Error...didn't work!"
		end
	end


	def show
		#find the task needed and the comments associated with it
		@task_comments = @task.task_comments
		#ability to add a new task comment
		@task_comment = TaskComment.new
	end

	#--CLASS METHODS---------------------------------------------

	private

	def task_params
		params.require(:task).permit(:title, :due_date, :status)
	end

	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_task
		@task = Task.find(params[:id])
	end

end
