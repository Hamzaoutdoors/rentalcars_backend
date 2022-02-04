class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:destroy]

  # POST /signup
  def create
    user = User.new(user_params)

    if user.save
      token = encode_token({ user_id: user.id })
      render json: { user: { username: user.username, email: user.email, id: user.id }, token: "Bearer #{token}" },
             status: 201
    else
      render json: { error: user.errors.full_messages }, status: 400
    end
  end

  # POST /login
  def login
    user = User.find_by(email: params[:user][:email])

    if user&.authenticate(params[:user][:password])
      token = encode_token({ user_id: user.id })
      render json: { user: { username: user.username, email: user.email, id: user.id }, token: "Bearer #{token}" },
             status: 201
    else
      render json: { error: 'Invalid Email/Password' }, status: 401
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
