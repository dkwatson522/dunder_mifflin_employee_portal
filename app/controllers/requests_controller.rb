class RequestsController < ApplicationController
  before_action :load_user, only: [:index, :show, :edit, :update, :destroy]
  def index


  end

  def show
    render plain: "Request show page"
  end

  def edit
    @request = @user.requests.find(params[:id])
    # render plain: "Request edit page"
  end

  private
    def load_user
        user_id = params[:user_id]
        @user = User.find_by(id: user_id)
    end
end
