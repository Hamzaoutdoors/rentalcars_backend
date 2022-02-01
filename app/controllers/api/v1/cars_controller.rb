class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show destroy]

  # GET /cars
  def index
    @cars = Car.all

    render json: @cars
  end

  # GET /cars/1
  def show
    render json: @car.to_json(include: [:description])
  end

  # POST /cars
  def create
    @car = Car.new(car_params.merge(user_id: @user.id))

    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    render json: @car

    @car.destroy
  end

  private

  def set_car
    @car = Car.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:name, :brand, :imgUrl, :user_id)
  end
end
