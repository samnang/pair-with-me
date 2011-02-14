class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def view_logged_in_user_profile?
    params[:id] == current_user.username
  end
end
