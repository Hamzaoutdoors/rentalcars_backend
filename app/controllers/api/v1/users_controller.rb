class Api::V1::UsersController < ApplicationController
  # GET /users
  def index
    @cars = Car.all

    render json: @cars
  end

  # POST /users
  def create
    user = User.new(user_params)

    if @user.save
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, time: time }, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  def login
    user = User.find_by(username: params[:username])

    if user
      payload = {user_id: user.id}
      token = encode(payload)
      render :json => {user: user, token: token}
    else
      render json: {error: "User not found"}
    end
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
