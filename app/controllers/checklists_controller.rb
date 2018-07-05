class ChecklistsController < ApplicationController
  before_action :set_checklist, only: %i[show edit update destroy complete]
  skip_before_action :verify_authenticity_token, only: :complete
  skip_before_action :authenticate_user!, only: :complete

  def index
    @trip = Trip.find(params[:trip_id])
    @checklists = @trip.checklists
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @checklist = Checklist.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @checklist = Checklist.new(checklist_params)
    @checklist.trip = @trip
    if @checklist.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    if @checklist.update(checklist_params)
      redirect_to trip_path(@trip), notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @checklist.destroy
    redirect_to trip_path(@trip), notice: 'Note was successfully destroyed.'
  end

  def complete
    @trip = Trip.find(params[:trip_id])
    if @checklist.done?
      @checklist.update(done: false)
    else
      @checklist.update(done: true)
    end
    render json: { done: @checklist.done? }
  end

  private

  def set_checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:description, :done, :title)
  end
end
