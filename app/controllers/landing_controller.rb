class LandingController < ApplicationController
  include Authentication
  allow_unauthenticated_access only: %i[index]
  
  def index
    if authenticated?
      redirect_to trips_path 
    end
    # Landing page for guests
  end
end