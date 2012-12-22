class Administration::ProjectsController < AdministrationController
	# GET /administration/projects
  # GET /administration/projects.json
  def index
    @projects = Project.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /administration/projects/1
  # GET /administration/projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /administration/projects/new
  # GET /administration/projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /administration/projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @project_photos = @project.project_photos
  end

  # POST /administration/projects
  # POST /administration/projects.json
  def create
    @project = Project.new(params[:project])
    @project.rating=0
    unless params[:photos].nil?
        params[:photos].each do |photo|
        @project.project_photos << ProjectPhoto.create(:image => photo)
        end
    end

    respond_to do |format|
      if @project.save
        format.html { redirect_to administration_project_path(@project), notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/projects/1
  # PUT /administration/projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to administration_project_path(@project), notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/projects/1
  # DELETE /administration/projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to administration_projects_path }
      format.json { head :no_content }
    end
  end
end
