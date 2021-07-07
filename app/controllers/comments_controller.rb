class CommentsController < ApplicationController

  def create
    authorize! :create, Comment, message: "You are not authorized"

    @post = Post.find(params[:post_id])
	  @comment = @post.comments.create(comment_params)
    @comment = current_user.comments.build(comment_params)
    @comment.save

    redirect_to post_path(@post)
  end

  def edit
    @comment = Post.find(params[:post_id]).comments.find(params[:id])
  end

  def update
    authorize! :update, Comment, message: "You are not authorized"

    @comment = Post.find(params[:post_id]).comments.find(params[:id])
    
    if @comment.update(comment_params)
      redirect_to @comment.post
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, Comment, message: "You are not authorized"

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
		params.require(:comment).permit(:comments)
    end
end
