class Administration::CompaniesController < AdministrationController
  COMPANY_ID = 1
  # GET /administration/companies/1
  # GET /administration/companies/1.json
  def show

  	begin
    	@company = Company.find(COMPANY_ID)
    rescue ActiveRecord::RecordNotFound
    	@company = Company.create({:description => ''})
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end    
  end

  # GET /administration/companies/1/edit
  def edit
    begin
    	@company = Company.find(COMPANY_ID)
    rescue ActiveRecord::RecordNotFound
    	@company = Company.create({:description => ''})
    end
  end

  # PUT /administration/companies/1
  # PUT /administration/companies/1.json
  def update
    @company = Company.find(COMPANY_ID)

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to administration_company_path(@company), notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end
end
