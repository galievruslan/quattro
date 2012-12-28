class Administration::ModelsController < AdministrationController
  # GET /models
  # GET /models.json
  def index
    @brand = Brand.find(params[:brand_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brand.models }
    end
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @brand = Brand.find(params[:brand_id])
    @model = Model.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @model }
    end
  end

  # GET /models/new
  # GET /models/new.json
  def new
    @brand = Brand.find(params[:brand_id])
    @model = Model.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @model }
    end
  end

  # GET /models/1/edit
  def edit
    @brand = Brand.find(params[:brand_id])
    @model = Model.find(params[:id])
  end

  # POST /models
  # POST /models.json
  def create
    @brand = Brand.find(params[:brand_id])
    @model = Model.new(params[:model])
    @brand.models << @model

    respond_to do |format|
      if @brand.save
        format.html { redirect_to administration_brand_models_path(@brand), notice: 'Model was successfully created.' }
        format.json { render json: @model, status: :created, location: @model }
      else
        format.html { render action: "new" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /models/1
  # PUT /models/1.json
  def update
    @brand = Brand.find(params[:brand_id])
    @model = Model.find(params[:id])

    respond_to do |format|
      if @model.update_attributes(params[:model])
        format.html { redirect_to administration_brand_models_path(@brand), notice: 'Model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model = Model.find(params[:id])
    @brand = Brand.find(@model.brand_id)
    @model.destroy

    respond_to do |format|
      format.html { redirect_to administration_brand_models_path(@brand) }
      format.json { head :no_content }
    end
  end
end
