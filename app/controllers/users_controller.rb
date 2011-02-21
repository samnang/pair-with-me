class UsersController < ApplicationController
  before_filter :authenticate_user!, :only_update_logged_in_user_profile, :only => :update

  def index
    @users = User.order(:full_name).page(params[:page])
  end

  def show
    @user = User.find_by_username(params[:id])

    if user_signed_in? and not view_logged_in_user_profile?
      @pair_request = @user.receive_from.build(:sender_id => current_user.id)
    end
  end

  def update
    respond_to do |format|
      if current_user.update_attributes(params[:user])
        format.json { head :ok }
      else
        format.json  { render :json => current_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
  def only_update_logged_in_user_profile
    unless view_logged_in_user_profile?
      render :nothing => true, :status => :forbidden
    end
  end
end
