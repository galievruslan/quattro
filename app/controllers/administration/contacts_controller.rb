class Administration::ContactsController < AdministrationController
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @Contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @Contact = Contact.new
    @Type = params[:type]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @Contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    type = params[:type]
    @Contact
    case type
    when 'Email'
      @Contact = Email.new(params[:contact])
    when 'Phone'
      @Contact = Phone.new(params[:contact]) 
    else 'Address'
      @Contact = Address.new(params[:contact])
    end    

    @Company = Company.find(1)
    @Company.contacts << @Contact

    respond_to do |format|
      if @Company.save
        format.html { redirect_to edit_administration_company_path(1), notice: 'Contact was successfully created.' }
        format.json { render json: @Contact, status: :created, location: @Contact }
      else
        format.html { render action: "new" }
        format.json { render json: @Contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @Contact = Contact.find(params[:id])
    concret_contact = nil
    if params.has_key?(:email)
      concret_contact = params[:email]
    elsif params.has_key?(:phone)
      concret_contact = params[:phone]
    elsif params.has_key?(:address)
      concret_contact = params[:address]
    end

    respond_to do |format|
      if concret_contact!=nil && @Contact.update_attributes(concret_contact)
        format.html { redirect_to edit_administration_company_path(1), notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @Contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @Contact = Contact.find(params[:id])
    @Contact.destroy

    respond_to do |format|
      format.html { redirect_to edit_administration_company_path(1) }
      format.json { head :no_content }
    end
  end
end