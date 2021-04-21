module Api::V1
  class UsersController < ApplicationController
    def index
      if current_user
        @all_users = User.where.not(id: current_user.id).order('department, name')
      end
      render json: @all_users
    end
  end
end
