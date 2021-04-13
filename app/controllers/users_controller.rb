class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @all_users = User.where.not(id: current_user.id)
    end
    unless current_user
      redirect_to new_user_session_path, alert: "Please Log In"
    end
  end

  def new
    @new_user = User.new
  end

  def edit
  end

  def show
    @all_users = User.all
  end

  def create
    @new_user = User.create(user_params)

    redirect_to users_path
  end

  private
  def load_user
    user_id = params[:id]

    @user = User.find_by(id: user_id)
  end
  def user_params
    params
      .require(:user)
      .permit(:name, :email, :password, :password_confirmation, :role, :department, :salary, :experience, :paid_time_off, :manager_id, :is_admin, :image_url)
  end
end
