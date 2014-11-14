class EstablecPpalsController < ApplicationController
  # GET /establec_ppals
  # GET /establec_ppals.json

  
  def index
    @establec_ppals = EstablecPpal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @establec_ppals }
    end
  end

  # GET /establec_ppals/1
  # GET /establec_ppals/1.json
  def show
    @establec_ppal = EstablecPpal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @establec_ppal }
    end
  end

  # GET /establec_ppals/new
  # GET /establec_ppals/new.json
  def new
    @establec_ppal = EstablecPpal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @establec_ppal }
    end
  end

  # GET /establec_ppals/1/edit
  def edit
    @establec_ppal = EstablecPpal.find(params[:id])
  end

  # POST /establec_ppals
  # POST /establec_ppals.json
  def create
    @establec_ppal = EstablecPpal.new(params[:establec_ppal])

    respond_to do |format|
      if @establec_ppal.save
        format.html { redirect_to @establec_ppal, notice: 'Registro creado satisfactoriamente.' }
        format.json { render json: @establec_ppal, status: :created, location: @establec_ppal }
      else
        format.html { render action: "new" }
        format.json { render json: @establec_ppal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /establec_ppals/1
  # PUT /establec_ppals/1.json
  def update
    @establec_ppal = EstablecPpal.find(params[:id])

    respond_to do |format|
      if @establec_ppal.update_attributes(params[:establec_ppal])
        format.html { redirect_to @establec_ppal, notice: 'Registro editado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @establec_ppal.errors, status: :unprocessable_entity }
      end
    end
  end
 

  # DELETE /establec_ppals/1
  # DELETE /establec_ppals/1.json
  def destroy
    @establec_ppal = EstablecPpal.find(params[:id])
    @establec_ppal.destroy

    respond_to do |format|
      format.html { redirect_to establec_ppals_url }
      format.json { head :no_content }
    end
  end
end
