class TripDaysController < ApplicationController
  before_action :set_trip
  before_action :set_trip_day, only: [:update, :destroy]
  before_action :authorize_user

  def create
    @trip_day = @trip.trip_days.build(trip_day_params)
    
    if @trip_day.save
      redirect_to edit_trip_path(@trip), notice: "Day added successfully."
    else
      redirect_to edit_trip_path(@trip), alert: "Could not add day: #{@trip_day.errors.full_messages.join(', ')}"
    end
  end

  def update
    if @trip_day.update(trip_day_params)
      redirect_to edit_trip_path(@trip), notice: "Day updated successfully."
    else
      redirect_to edit_trip_path(@trip), alert: "Could not update day: #{@trip_day.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @trip_day.destroy
    redirect_to edit_trip_path(@trip), notice: "Day removed successfully."
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_trip_day
    @trip_day = @trip.trip_days.find(params[:id])
  end

  def authorize_user
    unless @trip.user_id == Current.user.id
      redirect_to trips_path, alert: "You are not authorized to perform this action."
    end
  end

  def trip_day_params
    params.require(:trip_day).permit(:day_number, :date, :title, :description, :location, images: [])
  end
end