class PostsController < ApplicationController
    # before this controller runs, run the 'find_post method' but only when trying to run show, edit, update and destroy
    # this is so you dont have to run a find command in all 4 methods when they need to get run
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    
    # Loop through all the posts on the forum, the main page.
    def index
        @posts = Post.all.order("created_at DESC")
    end
    
    #after pressing submit for a new post, runs the show method.
    #this finds the post that was just made with the ID
    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = current_user.posts.build    
    end
    
    def create
        @post = current_user.posts.build(post_params)
        
        # if the post saves with no issues, redirect the user to the posts show page
        # if there are issues, it will just render the new page (with the form again)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
        
    end
    
    def edit
        
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    def destroy
        @post.destroy
        redirect_to root_path
    end
    
    
    
    
    
    
    private
    
    def find_post
        @post = Post.find(params[:id])
    end
    
    #the params required to create a valid post. it needs a title and it needs content. Then it can create one.
    def post_params
        params.require(:post).permit(:title, :content)
    end
    
end
