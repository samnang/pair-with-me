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

  def update
    @pair = PairRequest.find(params[:id])
    @pair.status = params[:status]
    
    if pair_belongs_to_current_user?
      return render_permission_denied if @pair.status == "Accepted" and 
                                         @pair.sent_from?(current_user)
         
      @pair.save

      render 'update.js.haml'
    else

      render_permission_denied
    end
  end

  private
  
  def pair_belongs_to_current_user?
    @pair.sender == current_user || @pair.partner == current_user
  end

  def render_permission_denied
    render :nothing => true, :status => :forbidden
  end
end
