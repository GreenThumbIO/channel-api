class TransmissionsController < ApplicationController
  before_action :set_transmission, only: [:show, :update, :destroy]

  # GET /transmissions
  def index
    @transmissions = Transmission.all

    render json: @transmissions
  end

  # GET /transmissions/1
  def show
    render json: @transmission
  end

  # POST /transmissions
  def create
    @transmission = Transmission.new(transmission_params)

    if @transmission.save
      render json: @transmission, status: :created, location: @transmission
    else
      render json: @transmission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transmissions/1
  def update
    if @transmission.update(transmission_params)
      render json: @transmission
    else
      render json: @transmission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transmissions/1
  def destroy
    @transmission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transmission
      @transmission = Transmission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transmission_params
      params.require(:transmission).permit(:message)
    end
end
