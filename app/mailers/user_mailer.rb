class UserMailer < ApplicationMailer
    def send_greeting
        @user = params[:user]
        mail(to: @user.email, subject: "Good Morning")
    end
end
