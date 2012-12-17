class BodiesController < ApplicationController
  # GET /bodies
  # GET /bodies.json
  def index
    @bodies = Body.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bodies }
    end
  end

  # GET /bodies/1
  # GET /bodies/1.json
  def show
    @body = Body.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @body }
    end
  end
end
