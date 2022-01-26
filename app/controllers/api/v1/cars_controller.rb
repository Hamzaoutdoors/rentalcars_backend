class Api::V1::CarsController < ApplicationController

  # GET /cars
  def index
    @cars = Car.all

    render json: @cars
  end

  # GET /cars/1
  def show
    @car = Car.find_by_id(params[:id])
    render json: @car.to_json(include: [:description])
  end

  # POST /cars
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
  end

  private
  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:name, :brand, :imgUrl)
  end
end
