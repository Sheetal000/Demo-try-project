class UsersController < ApplicationController
    # before_action :authenticate_request
    skip_before_action :authenticate_request,only: [:create]
    def new
    end

    def index
        @user = User.all
        # @user = User.paginate(page: params[:page],per_page:5)
        render json: @user
    end

    def create
        # byebug
        @user = User.new(create_params)
        if @user.save
            # @user_service = UserService.new(@user,@message)
            # @user_service.send_greeting(@user,@message)
            # UserMailer.send_greeting(@user, @message).deliver_later
            UserMailer.with(user: @user).send_greeting.deliver_now
            render json: {user: @user}, notice: "Account Created"
        else
            render json: {error: @user.errors.messages}
        end
    end


    def show 
        @user = User.find(params[:id])
        render json: @user
    end


    def update 
        @user = User.find(params[:id])
        if @user = User.update(create_params)
         render json: {message: "user updated succesfully"} 
        else
         render json: @user.errors.full_messages, status: :unprocessable_entity
       end
    end

    private
    
    def create_params
        params.permit(:name, :email, :password, :pasword_confirmation)
    end
end
