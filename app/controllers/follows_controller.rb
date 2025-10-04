class FollowsController < ApplicationController
  before_action :require_authentication

  # Follow a user
  def create
    follower = current_user
    followee = User.find_by(id: params[:user_id])

    if followee.nil? || follower == followee
      redirect_to user_path(followee || root_path), alert: "Invalid follow action."
      return
    end

    follow = Follow.find_or_initialize_by(follower: follower, followee: followee)

    if follow.persisted?
      redirect_back fallback_location: root_path, notice: "You’re already following this user."
    elsif follow.save
      redirect_back fallback_location: root_path, notice: "You are now following #{followee.first_name}!"
    else
      redirect_back fallback_location: root_path, alert: "Unable to follow user."
    end

  end

  # Unfollow a user
  def destroy
    follow = Follow.find_by(id: params[:id])
    unfollowed_user = User.find_by(id: follow.followee_id)
    Rails.logger.info "🗑️ Destroying follow: #{follow.id}, unfollowing user: #{unfollowed_user&.id} - #{unfollowed_user&.first_name}"
    if follow
      follow.destroy
      redirect_back fallback_location: root_path, notice: "You have unfollowed #{unfollowed_user&.first_name}."
    else
      redirect_back fallback_location: root_path, alert: "You are not following this user."
    end
  end
end
