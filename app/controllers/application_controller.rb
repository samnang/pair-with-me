class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :viewing_logged_in_user_profile?

  private

  def viewing_logged_in_user_profile?
    user_signed_in? and params[:id] == current_user.username
  end
end
