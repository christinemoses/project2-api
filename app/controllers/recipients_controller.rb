class RecipientsController < ApplicationController
  before_action :set_recipient, only: [:update, :destroy, :show]


  # GET /holidays/1/recipients
  def index
    @recipients = current_user.holidays.find(params[:holiday_id]).recipients

    render json: @recipients
  end

  # GET /holidays/1/recipients/1
  def show
    render json: @recipient
  end

  # POST /holidays/1/recipients
  def create
    @recipient = current_user.holidays.find(params[:holiday_id]).recipients.new(recipient_params)

    if @recipient.save
      render json: @recipient, status: :created
    else
      render json: @recipient.errors, status: :unprocessable_entity
    end
  end

  # PATCH /holidays/1/recipients/1
  def update
    if @recipient.update(recipient_params)
      head :no_content
    else
      render json: @recipient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holidays/1/recipients/1
  def destroy
    @recipient.destroy

    head :no_content
  end

  def set_recipient
    @recipient = current_user.holidays.find(params[:holiday_id]).recipients.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(:name)
  end

  private :set_recipient, :recipient_params
end
