class SubregionsController < ApplicationController
  # GET /subregions
  # GET /subregions.json
  def index
    @subregions = Subregion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subregions }
    end
  end

  # GET /subregions/1
  # GET /subregions/1.json
  def show
    @subregion = Subregion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subregion }
    end
  end

  # GET /subregions/new
  # GET /subregions/new.json
  def new
    @subregion = Subregion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subregion }
    end
  end

  # GET /subregions/1/edit
  def edit
    @subregion = Subregion.find(params[:id])
  end

  # POST /subregions
  # POST /subregions.json
  def create
    @subregion = Subregion.new(params[:subregion])

    respond_to do |format|
      if @subregion.save
        format.html { redirect_to @subregion, notice: 'Subregion was successfully created.' }
        format.json { render json: @subregion, status: :created, location: @subregion }
      else
        format.html { render action: "new" }
        format.json { render json: @subregion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subregions/1
  # PUT /subregions/1.json
  def update
    @subregion = Subregion.find(params[:id])

    respond_to do |format|
      if @subregion.update_attributes(params[:subregion])
        format.html { redirect_to @subregion, notice: 'Subregion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subregion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subregions/1
  # DELETE /subregions/1.json
  def destroy
    @subregion = Subregion.find(params[:id])
    @subregion.destroy

    respond_to do |format|
      format.html { redirect_to subregions_url }
      format.json { head :no_content }
    end
  end
end
