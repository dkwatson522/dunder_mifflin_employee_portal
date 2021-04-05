class UserController < ApplicationController
  def index
    @user = User.all
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
end
