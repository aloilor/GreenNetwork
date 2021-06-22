class CommentsController < ApplicationController
  def new
  end

  def create
    id_post = params[:post_id]
    user_id = session[:user_id]
    @post = Post.find(id_post)
    @comment = @post.comments.create!(:comments => params[:comment][:comments],:user_id=> user_id)
    redirect_to posts_path
  end

  def destroy
  end
end
