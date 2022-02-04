class DescriptionsController < ApplicationController
  before_action :set_description, only: %i[show update destroy]

  # GET /descriptions
  def index
    @descriptions = Description.all

    render json: @descriptions
  end

  # GET /descriptions/1
  def show
    render json: @description
  end

  # POST /descriptions
  def create
    @description = Description.new(description_params)

    if @description.save
      render json: @description, status: :created, location: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  # DELETE /descriptions/1
  def destroy
    render json: @description

    @description.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_description
    @description = Description.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def description_params
    params.require(:description).permit(:insurance_fee, :price_daily, :price_monthly, :color)
  end
end
