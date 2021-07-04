class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]


    def index
        @posts = Post.all.order("created_at DESC").with_attached_image
        
    end

    def new
        # Associo utente con il post
        @post = current_user.posts.build
    end

    def create
        authorize! :create, Post, message: "You are not authorized"

        # Associo utente con il post
        @post = current_user.posts.build(post_params)
        @post.image.attach(params[:post][:image])
        if @post.save
            flash[:notice] = "Post created successfully"
            redirect_to @post
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments.order("created_at DESC")
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        authorize! :update, Post, message: "You are not authorized"

        @post = Post.find(params[:id])

        #Facciamo in modo che se nel form di edit l'immagine non venga reinserita, venga tenuta la precedente collegata al post
        if !params[:post][:image].nil?
            @post.image.attach(params[:post][:image])
        end
        
        if @post.update(post_params)
            flash[:notice] = "Post updated succesfully"
            redirect_to @post
        else
          render :edit
        end
    
    end 

    def destroy
        authorize! :destroy, Post, message: "You are not authorized"

        @post = Post.find(params[:id])
        @post.destroy
        
        flash[:notice] = "Post deleted succesfully"
        redirect_to root_path
    end

    def like
        @post = Post.find(params[:id])
        if params[:format] == 'like'
            @post.liked_by current_user
        elsif params[:format] == 'unlike'
            @post.unliked_by current_user
        end   
        redirect_back(fallback_location: root_path) 
    end

    private 
    def post_params
        params.require(:post).permit(:title, :description, :tag, :position, :image)
    end

end
