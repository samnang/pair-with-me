class PairRequestsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @receive_from = current_user.receive_from
    @request_to = current_user.request_to
    @pair_sessions = current_user.pair_sessions
  end

  def create
    @pair_request = current_user.request_to.build(params[:pair_request])
    if @pair_request.save
      flash[:notice] = "Your request has been sent."
    else
      flash[:error] = "Something went wrong, and your request has been canceled."
    end

    redirect_to @pair_request.partner
  end
end
