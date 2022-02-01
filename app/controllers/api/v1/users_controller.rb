class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: %i[show destroy]

  # POST /signup
  def create
    user = User.new(user_params)

    if user.save
      token = encode_token({ user_id: user.id })
      cookies.signed[:jwt] = { value:  token, httponly: true, expires: 1.hour.from_now }
      render json: { username: user.username, email: user.email }
    else
      render json: { error: 'Invalid username or password', status: :invalid_user }
    end
  end

  # POST /login
  def login
    user = User.find_by(username: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      token = encode_token({ user_id: user.id })
      cookies.signed[:jwt] = { value:  token, httponly: true, expires: 1.hour.from_now }
      render json: { username: user.username, email: user.email }
    else
      render json: { error: 'Invalid username or password', status: :user_not_found }
    end
  end

  # GET /auto_login
  def auto_login
    render json: @user
  end

  # def show
  #   render json: @user
  # end

  # # DELETE /users/1
  # def destroy
  #   render json: @user
  #   @user.destroy
  # end

  private

  # def set_user
  #   @user = User.find_by_id(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
