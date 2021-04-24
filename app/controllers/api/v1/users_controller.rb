module Api::V1
  class UsersController < ApplicationController
    # allows JSON requests
    protect_from_forgery unless: -> {request.format.json?}

    def index
      if current_user.department == 'human resources'
        @users = User.where.not(id: current_user.id).order('department, name')
      elsif current_user.employees.count > 0
        @users = current_user.employees
      end
      render json: @users
    end

    def destroy
      # binding.pry
      
    end
  end
end
