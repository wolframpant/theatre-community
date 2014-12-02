class CommentsController < ApplicationController

def new
  @pimpression = Impression.find(params[:impression_id])
  @comment = Comment.new
  authorize @comment
end

def create
  @comment = Comment.new(comment_params)
  @impression = Impression.find_by(id: @comment.impression_id)
  authorize @comment
  if @comment.save
    flash[:notice] = 'You have successfully added a comment.'
    redirect_to @impression
  else
    flash[:notice] = 'Please try again.'
    render :new
  end

end

def destroy

end

private

  def comment_params
    params.require(:comment).permit(:body, :impression_id)
  end

end