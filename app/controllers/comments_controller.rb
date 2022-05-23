class CommentsController < ApplicationController


    def create
        # find the review 
        @review = Review.find(params[:review_id])

        @comment = @review.comments.new(params.require(:comment).permit(:body))

        # save the comment to database
        @comment.save

        #go back to review page
        redirect_to review_path(@review)
    end

end
