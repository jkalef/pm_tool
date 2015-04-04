class CommentsController < ApplicationController

	def create
		#@comment = Comment.new(comment_params)
		#create a new comment for the user
		@comment = current_user.comments.new(comment_params)

		@discussion = Discussion.find(params[:discussion_id])
		@comment.discussion = @discussion

		if @comment.save
			redirect_to project_discussion_path(@discussion.project, @discussion)
		else
			render text: "Where am I supposed to go?"
		end
	end


	private

	#strong params
	def comment_params
		params.require(:comment).permit(:body)
	end

end
