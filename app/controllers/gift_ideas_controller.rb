class GiftIdeasController < ApplicationController
  before_action :set_gift_idea, only: [:update, :destroy]

  # GET /holidays/1/recipients/1/gift_ideas
  def index
    @gift_ideas = current_user.holidays.find(params[:holiday_id]).recipients.find(params[:recipient_id]).gift_ideas

    render json: @gift_ideas
  end

  # POST /holidays/1/recipients/1/gift_ideas
  def create
    @gift_idea = current_user.holidays.find(params[:holiday_id]).recipients.find(params[:recipient_id]).gift_ideas.new(gift_idea_params)

    if @gift_idea.save
      render json: @gift_idea, status: :created
    else
      render json: @gift_idea.errors, status: :unprocessable_entity
    end
  end

  # PATCH /holidays/1/recipients/1/gift_ideas/1
  def update
    if @gift_idea.update(gift_idea_params)
      head :no_content
    else
      render json: @gift_idea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holidays/1/recipients/1/gift_ideas/1
  def destroy
    @gift_idea.destroy
    head :no_content
  end

  def set_gift_idea
    @gift_idea = current_user.holidays.find(params[:holiday_id]).recipients.find(params[:recipient_id]).gift_ideas.find(params[:id])
  end

  def gift_idea_params
    params.require(:gift_idea).permit(:description)
  end

  private :set_gift_idea, :gift_idea_params
end
