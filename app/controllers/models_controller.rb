class ModelsController < ApplicationController
  # GET /models
  # GET /models.json
  def index

    @models
    if (params.has_key?('brand_id'))
      @models = Model.find_all_by_brand_id(params[:brand_id])
    else
      @models = Model.all
    end    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @models }
    end
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @model = Model.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @model }
    end
  end

end
