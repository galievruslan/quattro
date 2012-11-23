class ProjectPhotosController < ApplicationController
  # GET /project_photos
  # GET /project_photos.json
  def index
    @project_photos = ProjectPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_photos }
    end
  end

  # GET /project_photos/1
  # GET /project_photos/1.json
  def show
    @project_photo = ProjectPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_photo }
    end
  end

  # GET /project_photos/new
  # GET /project_photos/new.json
  def new
    @project_photo = ProjectPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_photo }
    end
  end

  # GET /project_photos/1/edit
  def edit
    @project_photo = ProjectPhoto.find(params[:id])
  end

  # POST /project_photos
  # POST /project_photos.json
  def create
    @project_photo = ProjectPhoto.new(params[:project_photo])

    respond_to do |format|
      if @project_photo.save
        format.html { redirect_to @project_photo, notice: 'Project photo was successfully created.' }
        format.json { render json: @project_photo, status: :created, location: @project_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @project_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_photos/1
  # PUT /project_photos/1.json
  def update
    @project_photo = ProjectPhoto.find(params[:id])

    respond_to do |format|
      if @project_photo.update_attributes(params[:project_photo])
        format.html { redirect_to @project_photo, notice: 'Project photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_photos/1
  # DELETE /project_photos/1.json
  def destroy
    @project_photo = ProjectPhoto.find(params[:id])
    @project_photo.destroy

    respond_to do |format|
      format.html { redirect_to project_photos_url }
      format.json { head :no_content }
    end
  end
end
