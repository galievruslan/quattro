class ActionRegistrationsController < ApplicationController
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
  end

  # POST /action_registrations
  # POST /action_registrations.json
  def create
    @action_registration = ActionRegistration.new(params[:action_registration])

    respond_to do |format|
      if @action_registration.save
        format.html { redirect_to @action_registration, notice: 'Action registration was successfully created.' }
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

    respond_to do |format|
      if @action_registration.update_attributes(params[:action_registration])
        format.html { redirect_to @action_registration, notice: 'Action registration was successfully updated.' }
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
      format.html { redirect_to action_registrations_url }
      format.json { head :no_content }
    end
  end
end
