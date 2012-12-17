class Administration::ProjectPhotosController < AdministrationController

  def index
    @project_photos = ProjectPhoto.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @project_photos.collect { |p| p.to_jq_upload }.to_json }
    end
  end

  def create
    p_attr = params[:picture]
    p_attr[:file] = params[:picture][:file].first if params[:picture][:file].class == Array

    @project_photo = ProjectPhoto.new(p_attr)
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