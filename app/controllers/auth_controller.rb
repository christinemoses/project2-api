#
class AuthController < ApplicationController
  skip_before_action :authenticate, only: [:login, :register] # this skips the action we specify with the conditions we specify (e.g. skip authentication before registering and logging in)

  # POST /login
  def login
    @user = User.authenticate credentials[:email], credentials[:password]
    if @user
      render json: @user, serializer: LoginUserSerializer, root: 'user' # serializer is a way to easily render json for data  to send to the front end
      # in this case it's sending the token
      # if it fails sends back the unauthorized header
    else
      head :unauthorized # head only returns headers - no content in the response - sends a status code only, no body
    end
  end

  # POST /register
  def register
    @user = User.create(credentials)

    if @user.valid?
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logout/1
  def logout # the current token you got on the front end is no longer usable and cannot be saved - invalidates it
    if current_user == User.find(params[:id])
      current_user.logout # authorization over authentication - you should not be able to log out someone else
      head :no_content
    else
      head :unauthorized
    end
  end

  def credentials
    params.require(:credentials).permit(:email,
                                        :password,
                                        :password_confirmation)
  end

  private :credentials
end
