class LandingController < ApplicationController
  allow_unauthenticated_access only: %i[index]

  def index
    # Landing page for guests
  end
end
