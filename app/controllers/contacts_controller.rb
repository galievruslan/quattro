class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index  
    @title = 'Contacts'
    @company = Company.first
    @contacts = @company.contacts.find(:all)
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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Contact }
    end
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @Contact = Contact.new(params[:Contact])

    respond_to do |format|
      if @Contact.save
        format.html { redirect_to @Contact, notice: 'Contact was successfully created.' }
        format.json { render json: @Contact, status: :created, location: @Contact }
      else
        format.html { render action: "new" }
        format.json { render json: @Contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
