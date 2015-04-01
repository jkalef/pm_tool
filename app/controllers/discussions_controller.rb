class DiscussionsController < ApplicationController

	def create
		@discussion = Discussion.new(disc_params)
		@project = Project.find(params[:project_id])

		#attach the discussion to the project
		@discussion.project = @project

		if @discussion.save
			redirect_to project_path(@project)
		else
			render "/projects/show"
		end
	end


	def destroy
		@discussion = Discussion.find(params[:id])
		@project = Project.find(params[:project_id])
		@discussion.destroy
		redirect_to project_path(@project)
	end	


	private

	def disc_params
		disc_params = params.require(:discussion).permit(:title, :description)
	end


end
