class MembersController < ApplicationController

  #--ACTIONS---------------------------------------
  #create a new membership...i.e., add someone to a project
  def create
    @membership = Member.new(member_params)
    @project = Project.find(params[:project_id])
    @membership.user_id = member_params[:user_id]
    @membership.project = @project
    #@user = User.find(params[:user_id])

    @membership.save
    redirect_to @project, notice: "Membership Added"

  end

  #remove someone from a project
  def destroy
  end

  def index
  end


  private

  def member_params
    params.require(:member).permit(:project_id, :user_id)
  end

end
