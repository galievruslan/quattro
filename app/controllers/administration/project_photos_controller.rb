class Administration::ProjectPhotosController < AdministrationController

  def index
    project = Project.find(2)
    @project_photos = project.project_photos
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @project_photos.collect { |p| p.to_jq_upload }.to_json }
    end
  end

  def create
    project = Project.find(2)
    p_attr = params[:project_photo]
    photo = params[:project_photo][:image].first if params[:project_photo][:image].class == Array


    @project_photo = ProjectPhoto.new(:image => photo)
    @project_photo.project_id = 2

    if @project_photo.save
      respond_to do |format|
        format.html {  
          render :json => [@project_photo.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@project_photo.to_jq_upload].to_json			
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @project_photo = ProjectPhoto.find(params[:id])
    @project_photo.destroy
    render :json => true
  end
end