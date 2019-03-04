class ComplaintsController < ApplicationController
  def create
    @complaint = Complaint.new(
      user: current_user,
      company_id: params[:company_id],
      content: params[:complaint][:content]
    )
    if @complaint.save
      respond_to :js
    else
      redirect_to root_path, alert: 'There was a mistake, please try again.'
    end
  end
end
