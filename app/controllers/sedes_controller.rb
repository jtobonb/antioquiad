class SedesController < ApplicationController
  # GET /sedes
  # GET /sedes.json

    def index
    if current_user.superadmin?
    @sedes = Sede.all
    else
      @grab_dane = PrincipalEstablec.where(correo: current_user.email)
      @dane= @grab_dane[0].dane_establec
      @sedes = Sede.where(dane_establec: @dane)
    end
  end

  # GET /sedes/1
  # GET /sedes/1.json
  def show
    @sede = Sede.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sede }
    end
  end

  # GET /sedes/new
  # GET /sedes/new.json
  def new
    @sede = Sede.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sede }
    end
  end

  # GET /sedes/1/edit
  def edit
    @sede = Sede.find(params[:id])
  end

  # POST /sedes
  # POST /sedes.json
  def create
    @sede = Sede.new(params[:sede])

    respond_to do |format|
      if @sede.save
        format.html { redirect_to @sede, notice: 'Registro creado satisfactoriamente.' }
        format.json { render json: @sede, status: :created, location: @sede }
      else
        format.html { render action: "new" }
        format.json { render json: @sede.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sedes/1
  # PUT /sedes/1.json
  def update
    @sede = Sede.find(params[:id])

    respond_to do |format|
      if @sede.update_attributes(params[:sede])
        format.html { redirect_to @sede, notice: 'Registro editado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sede.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sedes/1
  # DELETE /sedes/1.json
  def destroy
    @sede = Sede.find(params[:id])
    @sede.destroy

    respond_to do |format|
      format.html { redirect_to sedes_url }
      format.json { head :no_content }
    end
  end
end
