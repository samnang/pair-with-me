class UsersController < ApplicationController
  before_filter :authenticate_user!, :only_update_logged_in_user_profile, :only => :update

  def index
    @users = User.order(:full_name).page(params[:page])
  end

  def show
    @user = User.find_by_username(params[:id])

    if viewing_other_users_profile?
      @pair_request = @user.receive_from.build(:sender_id => current_user.id)
    end
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to current_user, :notice => "You updated your profile successfully."
    else
      #TODO: find a better way to display errors on the form

      error_message = "Please fix error(s): " + current_user.errors.full_messages.join(", ")
      redirect_to :back, :alert => error_message
    end
  end

  private

  def only_update_logged_in_user_profile
    if viewing_other_users_profile?
      render :nothing => true, :status => :forbidden
    end
  end

  def viewing_other_users_profile?
    user_signed_in? and not viewing_logged_in_user_profile?
  end
end
