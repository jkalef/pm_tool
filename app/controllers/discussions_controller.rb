class DiscussionsController < ApplicationController

	def create
		#@discussion = Discussion.new(disc_params)
		#make a new discussion under the users name
		@discussion = current_user.discussions.new(disc_params)
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


	def show
		@comment = Comment.new
		@discussion = Discussion.find(params[:id])
		#@project = Project.find(params[:project_id])

		#use this to display the comments that are related to
		#the specific discussion
		#@comments = @discussion.comments
		#this is for the new comments form	
	end


	def edit
		#find the discussion by its id to show
		@project = Project.find(params[:project_id])
		@discussion = Discussion.find(params[:id])
	end


	def update
		@project = Project.find(params[:project_id])
		@discussion = Discussion.find(params[:id])
		
		if @discussion.update(disc_params)
			redirect_to @project
		else
			render "/projects/show"
		end
		
	end


	private

	def disc_params
		disc_params = params.require(:discussion).permit(:title, :description)
	end


end
