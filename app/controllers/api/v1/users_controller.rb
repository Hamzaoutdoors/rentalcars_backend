class Api::V1::UsersController < ApplicationController
  # GET /users
  def index
    @cars = Car.all

    render json: @cars
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
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
