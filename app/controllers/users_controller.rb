#
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users # get a list of users and then do something to it (this is why it's on a separate line)
  end

  # GET /users/1
  def show
    if current_user == @user
      render json: @user, serializer: CurrentUserSerializer, root: 'user' # checks to see if the user being requested is the current user and then it provides additional information
    else
      render json: @user
    end
  end

  # PATCH /users/1
  def update
    if current_user == @user
      if @user.update(user_params) # if the current user is the user you want to update - if so, update, if not, don't update - can't modify things you didn't create
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      head :unauthorized
    end
  end

  # DELETE /users/1
  def destroy
    if current_user == @user # ensure you can't delete an account you didn't make - implies that you are then logged out
      @user.destroy
      head :no_content
    else
      head :unauthorized
    end
  end

  def set_user
    @user = User.find(params[:id]) # searches for the user whose id is being passed in
  end

  private :set_user
end
