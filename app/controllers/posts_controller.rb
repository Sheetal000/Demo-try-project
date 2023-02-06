class PostsController < ApplicationController
    # def index
    #     @posts=Post.all
    # end

    # def show 
    #      posts=Post.find(params[:id])
    # end 

    def new   
        @post = Post.new   
    end 

    def create  
        @post = Post.new(post_params) 
        @post.user = current_user
        if @post.save 
          redirect_to root_path   
        else   
          render :new   
        end   
    end

		def update
        @post = Post.find(params[:id]) 
        if @post.update(post_params)
          redirect_to root_path   
        else   
          render :new   
        end   
    end


		def destroy
			 @post = Post.find(params[:id])
			 @post.destroy
				redirect_to "/"
		end


		def like
			@post = Post.find_by(params[:id])
			if params[:format] == 'like'
				@post.liked_by current_user
			elsif params[:format] == "unlike"
				@post.unliked_by current_user
			end
		end

		private
    def post_params   
        params.require(:post).permit(:title, :description, :user_id, :category_id)   
    end
end
