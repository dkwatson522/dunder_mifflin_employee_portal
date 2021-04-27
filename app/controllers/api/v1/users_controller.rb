module Api::V1
  class UsersController < ApplicationController
    # allows JSON requests
    protect_from_forgery unless: -> {request.format.json?}

    def index

      if current_user.department == 'Human Resources'
        @users = User.where.not(id: current_user.id).with_attached_avatar.order('department, name')
      elsif current_user.employees.count > 0
        @users = current_user.employees.with_attached_avatar.order('department, name')
      end
      @all_users = @users.map do |user|
        user.as_json.merge({ avatar: Rails.application.routes.url_helpers.url_for( user.avatar) })
      end
      # binding.pry
      render json: @all_users
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      # binding.pry
      @user = User.find(params[:id])

      @user.destroy
    end

    private

    def user_params
      params
        .require(:user)
        .permit(:name, :email, :password, :password_confirmation, :role, :department, :salary, :experience, :paid_time_off, :manager_id, :is_admin, :image_url)
    end
  end
end
