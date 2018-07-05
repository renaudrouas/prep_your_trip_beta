class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show edit update destroy]



  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:reservation_number, :start_date, :end_date, :compagny_name, :ticket_file, :address_in, :address_out, :latitude, :longitude, :mode, :start_date_time, :end_date_time)
  end

end
