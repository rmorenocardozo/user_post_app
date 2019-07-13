class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      redirect_to post_path(post)
    else
      flash[:errors] = comment.errors.messages
      redirect_to post_path(post)
    end
  end
  def destroy
    comment = Comments.find_by(id: params[:id])
    comment.delete
    redirect_to root_path
  end
  private

  def comment_params #Esto filtra la información que deseo que el usuario incluya.
    params.require( :comment).permit(:description)
  end
end
