class SearchController < ApplicationController
  def index
    @query = params[:query]
    
    if @query.present?
      # Search users by first_name, last_name, or email, excluding current_user
      @users = User.where(
        "(LOWER(first_name) LIKE :q OR LOWER(last_name) LIKE :q OR LOWER(email_address) LIKE :q)",
        q: "%#{@query.downcase}%"
      )
      @users = @users.where.not(id: current_user.id) if current_user
      @users = @users.limit(10)
      
      # Search trips by title, excluding trips created by current_user
      @trips = Trip.where("LOWER(title) LIKE ?", "%#{@query.downcase}%")
      @trips = @trips.where.not(user_id: current_user.id) if current_user
      @trips = @trips.limit(10)
    else
      @users = []
      @trips = []
    end
  end
end
