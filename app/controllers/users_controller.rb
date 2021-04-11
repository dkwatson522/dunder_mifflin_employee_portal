class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
    @all_users = User.all
    unless current_user
      redirect_to new_user_session_path, alert: "Please Login"
    end
  end

  def new
    @new_user = User.new
  end

  def edit
  end

  def show
  end

  def create
  end

  private
  def load_user
    user_id = params[:id]

    @user = User.find_by(id: user_id)
  end
end
