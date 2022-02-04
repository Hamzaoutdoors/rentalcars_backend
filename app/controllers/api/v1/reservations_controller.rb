class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]

  # GET /reservations
  def index
    @user = logged_in_user
    @reservations = @user.reservations.includes(:city, car: [:description])

    if @user
      render json: @reservations.to_json(include: [:city, { car: { include: [:description] } }])
    else
      render json: { error: 'No Reservation Found' }, status: 409
    end
  end

  # POST /reservations
  def create
    @car = Car.find_by_id(params[:reservation][:car_id])
    @reservation = Reservation.new(reservation_params.merge(user_id: @user.id, car_id: @car.id))

    if @reservation.save
      render json: @reservation.to_json(include: [:city, { car: { include: [:description] } }]), status: :created
    else
      render json: { error: @car.errors.full_messages }, status: 409
    end
  end

  # DELETE /reservations/1
  def destroy
    if @reservation
      @reservation.destroy
      if @reservation.destroyed?
        render json: { message: "Reservation with id: #{params[:id]} Successfully Canceled", id: params[:id] },
               status: 200
      else
        render json: { error: "Reservation with id: #{params[:id]} cannot be canceled" }, status: 400
      end
    else
      render json: { error: 'Reservation not found' }, status: 409
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :city_id, :car_id)
  end
end
