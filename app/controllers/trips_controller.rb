class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ create edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @trips = Trip.all.order(created_at: :desc)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
    @trip.trip_days.build(day_number: 1)
  end

  def create
    @trip = Current.user.trips.build(trip_params)
    
    if @trip.save
      redirect_to @trip, notice: "Trip was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Build a new empty trip_day for the form
    @trip.trip_days.build if @trip.trip_days.empty?
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: "Trip was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy!
    redirect_to trips_path, notice: "Trip was successfully deleted."
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def set_user
    if @trip && @trip.user_id != Current.user.id
      redirect_to trips_path, alert: "You are not authorized to perform this action."
    end
  end

  def trip_params
    params.require(:trip).permit(
      :title, :description, :start_date, :end_date, :location, :in_planning, images: [],
      trip_days_attributes: [:id, :day_number, :date, :location, :title, :description, { images: [] }, :_destroy]
    )
  end
end