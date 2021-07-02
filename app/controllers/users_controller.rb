class UsersController < ApplicationController
    def show
        @user = current_user
        @posts = @user.posts
    end

    def index
       
    end


    
end