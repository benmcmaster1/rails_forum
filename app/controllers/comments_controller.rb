class CommentsController < ApplicationController
    def create
        # When creating a comment, it:
        # - grabs the post you want to comment on (with the post id)
        @post = Post.find(params[:post_id])
        
        # - takes the comment you've entered (in the view) and creates it with
        #   the param of 'comment' (it grabbed this from the view - text area)
        @comment = @post.comments.create(params[:comment].permit(:comment))
        
        @comment.user_id = current_user.id if current_user
        
        # if the comment save was successful, go to that posts page
        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    
    def edit
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        
        if @comment.update(params[:comment].permit(:comment))
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end
    
end
