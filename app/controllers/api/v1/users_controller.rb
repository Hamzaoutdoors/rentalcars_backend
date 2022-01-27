class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
  before_action :set_user, only: [:destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      token = encode_token({user_id: user.id})
      render json: {user: user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def login
    user = User.find_by(username: params[:user][:username])

    if user
      token = encode_token({user_id: user.id})
      render json: {user: user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def auto_login
    render json: @user
  end

  def token_authenticate
    token = request.headers['Authenticate']
    user = User.find(decode(token)['user_id'])
    render json: user
  end

  def show; end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
