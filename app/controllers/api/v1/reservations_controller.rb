class Api::V1::ReservationsController < ApplicationController
  # GET /reservations
  def index
    @reservations = Reservation.all
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
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :user_id, :city_id, :car_id)
  end
end
