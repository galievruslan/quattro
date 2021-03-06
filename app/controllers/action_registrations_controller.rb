class ActionRegistrationsController < ApplicationController

  # GET /action_registrations/new
  # GET /action_registrations/new.json
  def new
    @action_registration = ActionRegistration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action_registration }
    end
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

    @customer = Customer.new({:name => "some customer name"})

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
    
    @name
    if (params.has_key?(:name) && !params[:name].empty?)
      @customer.name = params[:name]
    end

    @date=DateTime.now.to_date

    if (!@phone && !@email && !@name)
      @action_registration.errors.add(:email, "email or phone or name shuld be filled in")
      @action_registration.errors.add(:phone, "email or phone or name shuld be filled in")
      @action_registration.errors.add(:name, "email or phone or name shuld be filled in")
    end

    saved = false
    if (@action_registration.errors.empty?)
      @vehicle = Vehicle.create({:model => @model, :body => @body, :year => @year})      

      ActionRegistration.transaction do
        @customer.save
        @vehicle.save
        @action_registration = ActionRegistration.new({:vehicle => @vehicle, :customer => @customer, :date => @date})
        @action_registration.save

        saved = true
      end
    end

    respond_to do |format|
      if saved
        format.html { redirect_to root_path, notice: 'Action registration was successfully created.' }
        format.json { render json: @action_registration, status: :created, location: @action_registration }
      else
        format.html { render action: "new" }
        format.json { render json: @action_registration.errors, status: :unprocessable_entity }
      end
    end
  end
end
