class SedesController < ApplicationController
  # GET /sedes
  # GET /sedes.json
  def sedes_reporte

   @sedes = Subregion.joins("inner join municipios on municipios.cod_subregion = subregions.cod_subregion")
                          .joins("inner join principal_establecs on principal_establecs.cod_municipio = municipios.cod_municipio")
                          .joins("inner join sedes on sedes.dane_establec = principal_establecs.dane_establec")
                          .joins("inner join equipment on equipment.dane_sede = sedes.dane_sede")
                          .select("distinct municipios.nombre_municipio,municipios.cod_municipio, subregions.nombre_subregion,
                            subregions.cod_subregion,principal_establecs.dane_establec,principal_establecs.nombre as 'Nombre_Establecimiento',
                            principal_establecs.direccion, sedes.nombre as 'Nombre_Sede',sedes.dane_sede,
                            equipment.tipo, equipment.disco_duro, equipment.nombre as 'Nombre_Equipo', equipment.origen,
                             equipment.fecha_entrega, equipment.fabricante")
                          .where(:sedes => {:dane_sede => params[:dane_sede]})

  #Equipos por origen
  @subregions_conteo = @sedes.count
  @subregions_conteo_media = @sedes.where(:equipment => {:origen => "P_MEDIA"}).count
  @subregions_conteo_virtual1 = @sedes.where(:equipment => {:origen => "Antioquia Virtual fase I"}).count
  @subregions_conteo_virtual2 = @sedes.where(:equipment => {:origen => "Antioquia Virtual fase 2"}).count
  @subregions_conteo_virtual3 = @sedes.where(:equipment => {:origen => "Antioquia Virtual fase 3"}).count
  @subregions_conteo_antioquia = @sedes.where(:equipment => {:origen => "ANTIOQUIA_DIGITAL fase 1"}).count
#Equipos por tipo 
  @subregions_conteo_escritorio = @sedes.where(:equipment => {:tipo => "escritorio"}).count
  @subregions_conteo_portatil = @sedes.where(:equipment => {:tipo => "portatil"}).count
  #Equipos por Fabricante 
  @subregions_conteo_hp = @sedes.where(:equipment => {:fabricante => "Hewlett-Packard"}).count
  @subregions_conteo_compaq = @sedes.where(:equipment => {:fabricante => "compaq"}).count
  @subregions_conteo_compumax = @sedes.where(:equipment => {:fabricante => "Compumax M722SR"}).count                        
  end


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
