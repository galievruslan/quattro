class Administration::ProjectPhotosController < AdministrationController

  def index
    project = Project.find(3)
    @project_photos = project.project_photos
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @project_photos.collect { |p| p.to_jq_upload }.to_json }
    end
  end

  def create
    project = Project.find(3)
    p_attr = params[:project_photo]
    p_attr[:image] = params[:project_photo][:file].first if params[:project_photo][:file].class == Array

    @project_photo = ProjectPhoto.new(p_attr)
    @project_photo.project_id = 3

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