class UserMailer < ApplicationMailer
  def new_request_email
    @request = params[:request]
    @user = @request.user
    @manager = @user.manager
    mail(to: @manager.email, subject: "New Request from #{@user.name.split.map(&:capitalize).join(' ')}")
  end
end
