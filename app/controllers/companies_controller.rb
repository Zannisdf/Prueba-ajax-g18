class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: :index

  def index
    @companies = Company.order(:name)
  end

  def new
    @company = Company.new
    respond_to :js
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      respond_to :js
    else
      redirect_to root_path, alert: 'There was an error, please try again.'
    end
  end

  def show
    @complaint = Complaint.new
    @complaints = @company.complaints.order('created_at DESC')
    respond_to :js
  end

  def edit
    respond_to :js
  end

  def update
    if @company.update(company_params)
      respond_to :js
    else
      redirect_to root_path, alert: 'There was an error, please try again.'
    end
  end

  def destroy
    @company.destroy
    respond_to :js
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
