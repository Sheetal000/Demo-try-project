class PostsController < ApplicationController
  before_action :set_post,  only: [:edit, :update, :destroy, :like_post,:new]
  # before_action :set_like, only: :like_post

    def index
      @posts = Post.all.includes(:likes)
      @posts = Post.order(:title).page params[:page]
      render json: @posts
    end

    def new
      @post = Post.new 
    end
    
		def edit
		end

    def create
      @post = Post.new(post_params) 
      # @post.user_id = current_user.id
      if @post.save
        render json: @post
      else
        render json: @post.errors.full_messages, status: :unprocessable_entity
      end
    end

		def update
      if @post.update(post_params)
        render json: {message: "post updated successfully"}
      else   
        render json: @post.errors.full_messages, status: :unprocessable_entity
      end
    end

		def destroy
			 if @post.destroy
				render json: {message: "post deleted succesfully"}, status: :ok
      else
       render json: {message: "only post can be delete"}, status: :ok
		  end
    end


    # find  => Post.find(1)
    # find_by => specific column = Post.find_by(name: "ABC"), Post.find_by(name: "ABC", title: "test")
    # find_by_column_name => Post.find_by_name("ABC")

		def like_post
      @current_user_like = @post.likes.find_by(user_id: params[:user_id])
			if @current_user_like
				render json: {message: "updated successfully !"}, status: :ok  if @current_user_like.update(active: false)
			else
				render json: {message: "created successfully !"}, status: :ok  if @post.likes.create(user_id: params[:user_id] , active: true)
			end
		end

    def search
      if params[:search].blank? 
        render json: {"data": "search params is not passed!"}
      else
       @posts = render json: Post.all.where("title LIKE ? or description LIKE ?","%#{params[:search]}%","%#{params[:search]}%")
      end    
    end


    # def search
    #   @results = Post.where("title LIKE ?", "%#{params[:search]}%") 
    # end
    

    def services_posts
      @posts = CarDekho.new.fetch
      render json: @posts
    end

		private

    def post_params   
      params.require(:post).permit(:title, :description, :user_id, :category_id, :insta_image,:search)   
    end

    def set_post
      @post = Post.find_by_id(params[:id])
      render json: {message: "Post not found"}, status: :not_found unless @post
    end

    def set_like
      @current_user_like = @post.likes.find_by(user_id: current_user.id)
    end

		# def already_liked?
		# 	Like.where(user_id: current_user.id, post_id:
		# 	params[:post_id], active: true).exists?
		# end
end
