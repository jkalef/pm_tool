class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@discussion = Discussion.find(params[:discussion_id])
		@comment.discussion = @discussion

		if @comment.save
			redirect_to discussion_path(@discussion)
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
