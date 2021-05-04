class ApplicationController < ActionController::Base
  before_action :load_users_email

  def after_sign_in_path_for(resource)
    users_path
  end

  private
  def load_users_email
    @users_email = User.all
  end
end
