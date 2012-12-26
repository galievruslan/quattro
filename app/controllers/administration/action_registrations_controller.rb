class Administration::ActionRegistrationsController < AdministrationController
  
  # GET /action_registrations
  # GET /action_registrations.json
  def index
    @action_registrations = ActionRegistration.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @action_registrations }
    end
  end

  # GET /action_registrations/1
  # GET /action_registrations/1.json
  def show
    @action_registration = ActionRegistration.find(params[:id])
    @customer = Customer.find_by_id(@action_registration.customer_id)
    @vehicle= Vehicle.find_by_id(@action_registration.vehicle_id)
    if @action_registration.status==true
      @status='Ready'
    else
      @status='Not ready'
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @action_registration }
    end
  end

  # GET /action_registrations/new
  # GET /action_registrations/new.json
  def new
    @action_registration = ActionRegistration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action_registration }
    end
  end

  # GET /action_registrations/1/edit
  def edit
    @action_registration = ActionRegistration.find(params[:id])
    @customer = Customer.find_by_id(@action_registration.customer_id)
    @vehicle= Vehicle.find_by_id(@action_registration.vehicle_id)
    @brand=@vehicle.model.brand
    @model=@vehicle.model
    @body=@vehicle.body
    @year=@vehicle.year
    @name=@customer.name
    @email=@customer.contacts.find_by_type(:Email).value
    @phone=@customer.contacts.find_by_type(:Phone).value
  end

  # POST /action_registrations
  # POST /action_registrations.json
  def create
    @action_registration = ActionRegistration.new

    @brand
    if (params.has_key?(:brand_id) && !params[:brand_id].empty?)
      @brand = Brand.find(params[:brand_id])
    else
      @action_registration.errors.add(:brand_id, "wasn't filled in")
    end

    @model
    if (params.has_key?(:model_id) && !params[:model_id].empty?)
      @model = @brand.models.find(params[:model_id])
    else
      @action_registration.errors.add(:model_id, "wasn't filled in")
    end

    @body
    if (params.has_key?(:body_id) && !params[:body_id].empty?)
      @body = Body.find(params[:body_id])
    else
      @action_registration.errors.add(:body_id, "wasn't filled in")
    end

    @year
    if (params.has_key?(:year) && !params[:year].empty?)
      @year = params[:year]
    else
      @action_registration.errors.add(:year, "wasn't filled in")
    end    

    @customer = Customer.new
    
    @name
    if (params.has_key?(:name) && !params[:name].empty?)
      @customer.name = params[:name]
    else
      @action_registration.errors.add(:name, "wasn't filled in")
    end 
    
    @phone
    if (params.has_key?(:phone) && !params[:phone].empty?)
      @phone = Phone.new({:value => params[:phone]})
      @customer.contacts << @phone
    end 

    @email
    if (params.has_key?(:email) && !params[:email].empty?)
      @email = Email.new({:value => params[:email]})
      @customer.contacts << @email
    end 

    @date=DateTime.now.to_date
    

    if (!@phone && !@email)
      @action_registration.errors.add(:email, ' or phone shuld be filled in')
    end

    saved = false
    if (@action_registration.errors.empty?)
      @vehicle = Vehicle.create({:model => @model, :body => @body, :year => @year})      

      ActionRegistration.transaction do
        @customer.save
        @vehicle.save
        @action_registration = ActionRegistration.new({:vehicle => @vehicle, :customer => @customer, :date => @date, :status => false  })
        @action_registration.save

        saved = true
      end
    end

    respond_to do |format|
      if saved
        format.html { redirect_to administration_action_registration_path(@action_registration), notice: 'Action registration was successfully created.' }
        format.json { render json: @action_registration, status: :created, location: @action_registration }
      else
        format.html { render action: "new" }
        format.json { render json: @action_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /action_registrations/1
  # PUT /action_registrations/1.json
  def update
    @action_registration = ActionRegistration.find(params[:id])

    @brand
    if (params.has_key?(:brand_id) && !params[:brand_id].empty?)
      @brand = Brand.find(params[:brand_id])
    else
      @action_registration.errors.add(:brand_id, "wasn't filled in")
    end

    @model
    if (params.has_key?(:model_id) && !params[:model_id].empty?)
      @model = @brand.models.find(params[:model_id])
    else
      @action_registration.errors.add(:model_id, "wasn't filled in")
    end

    @body
    if (params.has_key?(:body_id) && !params[:body_id].empty?)
      @body = Body.find(params[:body_id])
    else
      @action_registration.errors.add(:body_id, "wasn't filled in")
    end

    @year
    if (params.has_key?(:year) && !params[:year].empty?)
      @year = params[:year]
    else
      @action_registration.errors.add(:year, "wasn't filled in")
    end    

    @customer = Customer.find_by_id(@action_registration.customer_id)
    
    @name
    if (params.has_key?(:name) && !params[:name].empty?)
      @customer.name = params[:name]
    end
    
    @phone
    if (params.has_key?(:phone) && !params[:phone].empty?)
      @customer.contacts.find_by_type(:Phone).update_attributes(value: params[:phone])
    end

    @Email
    if (params.has_key?(:email) && !params[:email].empty?)
      @customer.contacts.find_by_type(:Email).update_attributes(value: params[:email])
    end
    
    @vehicle= Vehicle.find_by_id(@action_registration.vehicle_id)

    @date=DateTime.now.to_date

    if (!@phone && !@email && !@name)
      @action_registration.errors.add(:email, "email or phone or name shuld be filled in")
      @action_registration.errors.add(:phone, "email or phone or name shuld be filled in")      
      @action_registration.errors.add(:name, "email or phone or name shuld be filled in")
    end

    @vehicle.update_attributes({:model => @model, :body => @body, :year => @year})
    @action_registration.update_attributes({:vehicle => @vehicle, :customer => @customer, :date => @date, :status => false  })
    @customer.save

    respond_to do |format|
      if @action_registration.update_attributes(params[:action_registration])
        format.html { redirect_to administration_action_registration_path(@action_registration), notice: 'Action registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @action_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_registrations/1
  # DELETE /action_registrations/1.json
  def destroy
    @action_registration = ActionRegistration.find(params[:id])
    @action_registration.destroy

    respond_to do |format|
      format.html { redirect_to administration_action_registrations_path }
      format.json { head :no_content }
    end
  end

  def change_status
    @action_registration = ActionRegistration.find(params[:id])
    if @action_registration.status==true
      @action_registration.status=false
    else
      @action_registration.status=true
    end
    @action_registration.save
    respond_to do |format|
        format.html { redirect_to administration_action_registrations_path, notice: 'Action registration status was changed.' }
        format.json { head :no_content }      
    end
  end
end