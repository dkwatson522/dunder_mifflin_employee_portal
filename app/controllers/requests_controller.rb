class RequestsController < ApplicationController
  before_action :load_user
  before_action :load_request, only: [:edit, :update]

  def index
  end

  def new
    @new_request = Request.new
  end

  def show
  end

  def edit
  end

  def update
    # binding.pry
    # initial_request_status = @request.is_approved

    if !@request.is_approved && request_params[:is_approved] == "true"
      new_pto_balance = @user.paid_time_off - request_params[:number_of_hours].to_f
      @user.update(paid_time_off: new_pto_balance)
    end

    if @request.is_approved && request_params[:is_approved] == "false"
      recouped_pto_balance = @user.paid_time_off + @request.number_of_hours
      @user.update(paid_time_off: recouped_pto_balance)
    end

    if @request.number_of_hours != request_params[:number_of_hours].to_f && request_params[:is_approved] == "true"
      pto_variance = @request.number_of_hours - request_params[:number_of_hours].to_f
      updated_pto_balance = @user.paid_time_off + pto_variance
      @user.update(paid_time_off: updated_pto_balance)
    end

    if request_params[:is_approved] == "false"
      @request.update(request_params.except(:number_of_hours))
    else
      @request.update(request_params)
    end

    redirect_to user_path(@user)
  end

  def create
    # @request = @user.requests
    @request = @user.requests.build(request_params)
    # binding.pry
    if @request.save
      UserMailer.with(request: @request).new_request_email.deliver_now
      redirect_to user_path(@user)
    else
      # add error handling
    end
  end

  def destroy
    @user.requests.find(params[:id]).destroy

    redirect_to user_path(@user)
  end

  private

    def load_user
      @user ||= User.find_by(id: params[:user_id])
    end

    def load_request
      @request ||= @user.requests.find(params[:id])
    end

    def request_params
      params
        .require(:request)
        .permit(:start_date, :end_date, :number_of_hours, :is_approved)
    end
end
