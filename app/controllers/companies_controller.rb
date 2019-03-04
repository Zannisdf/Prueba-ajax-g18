class CompaniesController < ApplicationController
  def index
    @companies = Company.all
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
      redirect_to root_path 'There was an error, please try again.'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
