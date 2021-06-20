class PostsController < ApplicationController

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to @post
        else
          render :edit
        end
    
    end 

    def post_params
        params.require(:post).permit(:title, :description, :image, :tag, :position)
    end
end
