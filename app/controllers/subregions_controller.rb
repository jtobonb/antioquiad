class SubregionsController < ApplicationController
  # GET /subregions
  # GET /subregions.json
  def subregions_reporte

   @subregions = Subregion.joins("inner join municipios on municipios.cod_subregion = subregions.cod_subregion")
                          .joins("inner join principal_establecs on principal_establecs.cod_municipio = municipios.cod_municipio")
                          .joins("inner join sedes on sedes.dane_establec = principal_establecs.dane_establec")
                          .joins("inner join equipment on equipment.dane_sede = sedes.dane_sede")
                          .select("distinct municipios.nombre_municipio,municipios.cod_municipio, subregions.nombre_subregion,
                            subregions.cod_subregion,principal_establecs.dane_establec,principal_establecs.nombre as 'Nombre_Establecimiento',
                            principal_establecs.direccion, sedes.nombre as 'Nombre_Sede',sedes.dane_sede,
                            equipment.tipo, equipment.disco_duro, equipment.nombre as 'Nombre_Equipo', equipment.origen,
                             equipment.fecha_entrega, equipment.fabricante")
                          .where(:subregions => {:nombre_subregion => params[:subregion]})

#Equipos por origen
  @subregions_conteo = @subregions.count
  @subregions_conteo_media = @subregions.where(:equipment => {:origen => "P_MEDIA"}).count
  @subregions_conteo_virtual1 = @subregions.where(:equipment => {:origen => "Antioquia Virtual fase I"}).count
  @subregions_conteo_virtual2 = @subregions.where(:equipment => {:origen => "Antioquia Virtual fase 2"}).count
  @subregions_conteo_virtual3 = @subregions.where(:equipment => {:origen => "Antioquia Virtual fase 3"}).count
  @subregions_conteo_antioquia = @subregions.where(:equipment => {:origen => "ANTIOQUIA_DIGITAL fase 1"}).count
#Equipos por tipo 
  @subregions_conteo_escritorio = @subregions.where(:equipment => {:tipo => "escritorio"}).count
  @subregions_conteo_portatil = @subregions.where(:equipment => {:tipo => "portatil"}).count
  #Equipos por Fabricante 
  @subregions_conteo_hp = @subregions.where(:equipment => {:fabricante => "Hewlett-Packard"}).count
  @subregions_conteo_compaq = @subregions.where(:equipment => {:fabricante => "compaq"}).count
  @subregions_conteo_compumax = @subregions.where(:equipment => {:fabricante => "Compumax M722SR"}).count



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
       format.xls # { send_data @products.to_csv(col_sep: "\t") }
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
      format.html { redirect_to subregions_url, notice: 'Registro eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end
end
