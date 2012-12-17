class CompaniesController < ApplicationController
  COMPANY_ID = 1
  # GET /companies/1
  # GET /companies/1.json
  def show
    @title = 'About us'
    @company = Company.find(COMPANY_ID)
    #@company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end
end
