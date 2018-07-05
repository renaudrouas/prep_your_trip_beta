class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  private

  def set_trip
    @trip = Trip.find(params[:id])
    # authorize @trip
  end

  def set_checklist
    @checklist = Checklist.find(params[:id])
    # authorize @task
  end

  def checklist_params
    params.require(:checklist).permit(:description, :done, :title)
  end

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :end_date, :latitude, :longitude, :title)
  end

end
