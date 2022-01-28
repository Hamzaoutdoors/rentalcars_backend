class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy]

  # GET /reservations
  def index
    @reservations = Reservation.where(user_id: @user.id)
    render json: @reservations.to_json(include: [:city, { car: { include: [:description] } }])
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    render json: @reservation
    @reservation.destroy
  end

  private
  
  def set_reservation
    @reservation = Reservation.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :user_id, :city_id, :car_id)
  end
end
