class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:update, :destroy, :show]

  # GET /holidays
  def index
    @holidays = current_user.holidays

    render json: @holidays
  end

  # GET /holidays/1
  def show
    render json: @holiday
  end

  # POST /holidays
  def create
    @holiday = current_user.holidays.new(holiday_params)

    if @holiday.save
      render json: @holiday, status: :created, location: @holiday
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # PATCH /holidays/1
  def update
    if @holiday.update(holiday_params)
      head :no_content
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holidays/1
  def destroy
    @holiday.destroy

    head :no_content
  end

  def set_holiday
    @holiday = current_user.holidays.find(params[:id])
  end

  def holiday_params
    params.require(:holiday).permit(:name)
  end

  private :set_holiday, :holiday_params
end
