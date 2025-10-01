class LandingController < ApplicationController
  include Authentication
  allow_unauthenticated_access only: %i[index]
  
  def index
    # Landing page for guests
  end
end