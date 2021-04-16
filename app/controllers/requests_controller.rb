class RequestsController < ApplicationController
  before_action :load_user, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  def index

  end
  def new
    @new_request = Request.new
  end
  def show

  end

  def edit
    @request = @user.requests.find(params[:id])
    # @end_date = @request.end_date
    # # render plain: "Request edit page"
  end
  def update
    @request = @user.requests.find(params[:id])
    @request.update(request_params)

    redirect_to user_path(@user)
  end

  def create
    @request = @user.requests
    @request.create(request_params)

    redirect_to user_path(@user)
  end

  private
    def load_user
        user_id = params[:user_id]
        @user = User.find_by(id: user_id)
    end
    def request_params
      params
        .require(:request)
        .permit(:start_date, :end_date, :number_of_hours, :is_approved)
    end
end
