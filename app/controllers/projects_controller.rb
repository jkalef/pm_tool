class ProjectsController < ApplicationController

	before_action :find_project, only: [:show, :edit, :update, :destroy]


	#lets add a search bar to search for specific projects
	def search
		#call the method search_result from my model
		@result = Project.search_result(params[:search_word])
		render :search
	end


	#GET
	#URL /projects/index
	def index

		#want to list all of my projects, sorted by most recent
		@projects = Project.order("created_at DESC")
	end

	def new
		#use this to create a new project
		#need to instantiate a bariable to store the data in
		@project = Project.new
	end

	def create
		#create a new project...pass values through strong params authorization
		#@project = Project.new(project_params)	
		@project = current_user.projects.new(project_params)

		#if the project is saved, then render the project page, 
		#else, render the new project page again w/ the errors
		if @project.save 
			redirect_to project_path(@project)
		else
			render :new
		end
	end

	def show
		#use this to display the discussions that are related to
		#the specific project
		@discussions = @project.discussions
		#this is for the new disussion form
		@discussion = Discussion.new

		@tasks = @project.tasks

		#show a different table for both completed and incomplete tasks
		@completed_tasks = @tasks.where(status: "complete")
		@incomplete_tasks = @tasks.where(status: "incomplete")
		@task = Task.new
	end

	def edit
		#need to grab the project for this page by its ID

	end


	def update
		#if the update is successful, redirect to the show page
		#if not successful, go to the edit page

		if @project.update(project_params)
			redirect_to project_path(@project)
		else
			render :edit
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end


	#methods only going to be used in this controller class
	private

	def project_params
		#strong params authentification
		project_params = params.require(:project).permit(:title, :description, :due_date)

	end

	def find_project
		@project = Project.find(params[:id])
	end


end
