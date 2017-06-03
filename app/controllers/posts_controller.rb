class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :home]
  def index
    @posts = Post.all
  end

  def home
   @posts = Post.last(6)
  end

  def new
    @post = Post.new
  end

 def create
  @post = Post.new post_params
  @post.user = current_user
    if @post.save
     redirect_to post_path(@post), notice: "created a post"
    else
      render :new
    end
 end

 def show
   @comment = Comment.new
   @post = Post.find params[:id]
 end

def edit
@post = Post.find params[:id]
end

def update
  @post = Post.find params[:id]
  if @post.update post_params
    redirect_to post_path
  else
    render :new
  end
end


def destroy
@post = Post.find params[:id]
if @post.destroy
  redirect_to posts_path
end
end

 private

def post_params
params.require(:post).permit(:title, :body, :created_at, :id, :updated_at )
end

end
