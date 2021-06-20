class PostsController < ApplicationController

    def index
        @posts = Post.all.order("created_at DESC").with_attached_image
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.image.attach(params[:post][:image])
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        @post.image.purge
        @post.image.attach(params[:post][:image])
        if @post.update(post_params)
          redirect_to @post
        else
          render :edit
        end
    
    end 

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        redirect_to root_path
    end
    
    private 
    
    def post_params
        params.require(:post).permit(:title, :description, :tag, :position, :image)
    end

    
    
end
