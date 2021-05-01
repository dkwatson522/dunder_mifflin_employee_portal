class UserMailer < ApplicationMailer
  def new_request_email
    @request = params[:request]
    @user = @request.user
    if @user.manager
      @manager = @user.manager
    elsif !@user.manager
      @manager = User.find_by(department:"Human Resources")
    end

    mail(to: @manager.email, subject: "New Request from #{@user.name.split.map(&:capitalize).join(' ')}")
  end
end
