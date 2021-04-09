class UserController < ApplicationController
  before_action :load_user, only: [:index, :show, :edit, :update, :destroy]

  def index
    users = User.all
    @user = users.sample
  end

  def edit
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: "...", role: "...")

    if @user.save
      redirect_to @user
    else
      render :index
    end
  end

  private
  def load_user
      user_id = params[:id]

      @user = User.find_by(id: user_id)
  end
end
