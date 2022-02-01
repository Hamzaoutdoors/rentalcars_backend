class Api::V1::UsersController < ApplicationController

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

  # DELETE /users/1
  def destroy
    cookies.delete(:jwt)
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
