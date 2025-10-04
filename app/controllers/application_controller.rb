class ApplicationController < ActionController::Base
  include Authentication
  allow_browser versions: :modern
  helper_method :current_user

  private

  def current_user
    resume_session
    Current.session&.user
  end
end