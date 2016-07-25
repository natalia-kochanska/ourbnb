class CommentsController < ApplicationController

  def create
  	@listing = Listing.find(params[:listing_id])
  	@comment = @listing.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  	redirect_to request.referer 
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer 

  end

  private
  def comment_params
      params.require(:comment).permit(:rating, :comment, :user_id, :listing_id)
  end

end
