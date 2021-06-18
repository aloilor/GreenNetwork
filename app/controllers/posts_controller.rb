class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    
    def show
    end

    def edit 
    end

    
    def set_post
      @post = Post.find(params[:id])
    end

    
    def post_params
      params.require(:post).permit(:title, :description, :image, :tag, :position)
    end
end
