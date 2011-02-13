class UsersController < ApplicationController
  before_filter :authenticate_user!, :only_update_logged_in_user_profile, :only => :update

  def show
    @user = User.find_by_username(params[:id])
  end

  def update
    @user = User.find_by_username(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { head :ok }
      else
        format.json  { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def only_update_logged_in_user_profile
    unless params[:id] == current_user.username
      render :nothing => true, :status => :forbidden
    end
  end
end
