class CommentsController < ApplicationController
  def new
  end

  def create
    id_post = params[:post_id]
		@post = Post.find(id_post)
		@user = current_user
		@comment = @post.comments.create!(params[:comment].permit(:comments, :user, :post))
		@comment.user_id = @user.id
		@comment.save!
		flash[:notice] = "A comment has from #{@user.email} been successfully added to #{@post.title}."
		redirect_to post_path(@post)
  end

  def destroy
    id = params[:id]
		id_post = params[:post_id]
		@post = Post.find(id_post)
		authorize! :destroy, @comment, :message => "BEWARE: You are not authorized to delete reviews."
		@comment = Comment.find(id)
		@comment.destroy
		flash[:notice] = "Your review has been deleted."
		redirect_to post_path(@post)
  end

  
end
