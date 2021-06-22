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
        # Associo utente con il post
        @post = current_user.posts.build(post_params)
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

        #Facciamo in modo che se nel form di edit l'immagine non venga reinserita, venga tenuta la precedente collegata al post
        if !params[:post][:image].nil?
            @post.image.attach(params[:post][:image])
        end
        
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
