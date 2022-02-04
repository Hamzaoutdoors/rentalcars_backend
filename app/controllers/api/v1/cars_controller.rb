class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show destroy]
  before_action :authorized, only: %i[show create destroy]

  # GET /cars
  def index
    @cars = Car.all.includes(:description)

    render json: @cars.to_json(include: [:description]), status: 200
  end

  # GET /cars/1
  def show
    if @car
      render json: @car.to_json(include: [:description]), status: :ok
    else
      render json: { error: 'Car not found' }, status: 400
    end
  end

  # POST /cars
  def create
    @car = Car.create(car_params.merge(user_id: @user.id))

    if @car.valid?
      @description = Description.create(description_params.merge(insurance_fee: 3, car_id: @car.id))
      if @description.valid?
        render json: @car.to_json(include: [:description]), status: :created
      else
        @car.destroy
        render json: { error: @description.errors.full_messages }, status: 409
      end
    else
      render json: { error: @car.errors.full_messages }, status: 409
    end
  end

  # DELETE /cars/1
  def destroy
    if @car
      @car.destroy
      if @car.destroyed?
        render json: { message: "Car with id: #{params[:id]} successfully destroyed", id: params[:id] }, status: :ok
      else
        render json: { error: "Car with id: #{params[:id]} cannot be destroyed" }, status: 400
      end
    else
      render json: { error: 'Car not found' }, status: 409
    end
  end

  private

  def set_car
    @car = Car.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:name, :brand, :imgUrl)
  end

  def description_params
    params.require(:description).permit(:price_daily, :price_monthly, :color)
  end
end
