module Api::V1
  class UsersController < ApplicationController
    def index
      if current_user.department == 'human resources'
        @users = User.where.not(id: current_user.id).order('department, name')
      elsif current_user.employees.count > 0
        @users = current_user.employees
      end
      render json: @users
    end
  end
end
