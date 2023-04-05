class ApplicationController < ActionController::Base
  include JsonWebToken
  # before_action :authenticate_request, only: [:create]
  before_action :authenticate_request
  # skip_before_action :verify_authenticity_token 
 	protect_from_forgery with: :null_session
 	# before_action :configure_permitted_parameters, if: :devise_controller?
 

  # def create

  # end

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decode = jwt_decode(header)
    @current_user = User.find(decode[:user_id])
end

  



  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  # end

end
