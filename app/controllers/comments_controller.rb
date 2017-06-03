class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
      if @comment.save
       redirect_to post_path(@post)
      else
        render 'posts/show'
      end
  end


   def edit
      @comment = Comment.find(params[:id])
      @post = Post.find(params[:post_id])
    end

  def update
    @post  = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update comment_params
      redirect_to post_path(@post)
    else
      redirect_to edit_post_comment_path(@post, @comment)
    end
  end


def destroy
  @comment = Comment.find(params[:id])
  @post = Post.find(params[:post_id])
  if @comment.destroy
    redirect_to post_path(@post)
end
end

 def show
 end

  private

  def comment_params
   params.require(:comment).permit(:body)
 end
end
