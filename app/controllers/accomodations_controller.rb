class AccomodationsController < ApplicationController
  before_action :set_accomodation, only: %i[show edit update destroy]




  private

  def set_accomodation
    @accomodation = Accomodation.find(params[:id])
    # authorize @accomodation
  end

  def accomodation_params
    params.require(:accomodation).permit(
      :address, :name, :e_mail, :phone_number,
      :latitude, :longitude, :kind, :start_date, :end_date, :trip_id, :reservation_number
    )
  end

end
