class SubregionsController < ApplicationController
  # GET /subregions
  # GET /subregions.json
  def subregions_reporte

    @subregions = Subregion.joins("inner join municipios mu on mu.cod_subregion = subregions.cod_subregion")
                          .joins("inner join principal_establecs pe on pe.cod_municipio = mu.cod_municipio")
                          .joins("inner join sedes se on se.dane_establec = pe.dane_establec")
                          .joins("inner join equipment eq on eq.dane_sede = se.dane_sede")
                          .select("mu.nombre_municipio,mu.cod_municipio, subregions.nombre_subregion,
                            subregions.cod_subregion,pe.dane_establec,pe.nombre 'Nombre_Establecimiento',pe.direccion,se.nombre 'Nombre_Sede', se.dane_sede,
                            eq.tipo, eq.disco_duro, eq.nombre, eq.origen, eq.fecha_entrega, eq.fabricante")
                          .where(nombre_subregion: params[:subregion])
  end

  def index
    @subregions = Subregion.all
    #Municipios de una Subregion
    @municipios = Subregion.joins("inner join municipios mu on mu.cod_subregion = subregions.cod_subregion")
    .select("distinct mu.nombre_municipio").where(nombre_subregion: "NORTE")

    #Establecimientos de un Municipio
    @establecimientos = Municipio.joins("inner join principal_establecs pe on pe.cod_municipio = municipios.cod_municipio")
    .select("distinct pe.nombre").where(nombre_municipio: "DONMATIAS")

    #Sedes de un Establecimiento
    @sedes = PrincipalEstablec.joins("inner join sedes se on se.dane_establec = principal_establecs.dane_establec")
    .select("se.nombre").where(nombre: "CER_CHALI")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subregions }
    end
  end 
def gerarquia
  @municipios = Subregion.join(:municipios)
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
        format.html { redirect_to @subregion, notice: 'Registro creado satisfactoriamente.' }
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
        format.html { redirect_to @subregion, notice: 'Registro editado satisfactoriamente.' }
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
