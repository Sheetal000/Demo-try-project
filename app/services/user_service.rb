class UserService

  def initialize(user,message)
    @user = user
    @message = message
  end

    def send_greeting(user,message)
      UserMailer.with(user: user, message:message).send_greeting.deliver_now
    end
end