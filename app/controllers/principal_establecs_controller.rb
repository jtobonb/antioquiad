class PrincipalEstablecsController < ApplicationController
  # GET /principal_establecs
  # GET /principal_establecs.json
  def establecimientos_reporte

   @establecimientos = Subregion.joins("inner join municipios on municipios.cod_subregion = subregions.cod_subregion")
                          .joins("inner join principal_establecs on principal_establecs.cod_municipio = municipios.cod_municipio")
                          .joins("inner join sedes on sedes.dane_establec = principal_establecs.dane_establec")
                          .joins("inner join equipment on equipment.dane_sede = sedes.dane_sede")
                          .select("municipios.nombre_municipio,municipios.cod_municipio, subregions.nombre_subregion,
                            subregions.cod_subregion,principal_establecs.dane_establec,principal_establecs.nombre as 'Nombre_Establecimiento',
                            principal_establecs.direccion, sedes.nombre as 'Nombre_Sede',sedes.dane_sede,
                            equipment.tipo, equipment.disco_duro, equipment.nombre as 'Nombre_Equipo', equipment.origen,
                             equipment.fecha_entrega, equipment.fabricante")
                          .where(:principal_establecs => {:dane_establec => params[:dane_establecimiento]})

  #Equipos por origen
  @subregions_conteo = @establecimientos.count
  @subregions_conteo_media = @establecimientos.where(:equipment => {:origen => "P_MEDIA"}).count
  @subregions_conteo_virtual1 = @establecimientos.where(:equipment => {:origen => "Antioquia Virtual fase I"}).count
  @subregions_conteo_virtual2 = @establecimientos.where(:equipment => {:origen => "Antioquia Virtual fase 2"}).count
  @subregions_conteo_virtual3 = @establecimientos.where(:equipment => {:origen => "Antioquia Virtual fase 3"}).count
  @subregions_conteo_antioquia = @establecimientos.where(:equipment => {:origen => "ANTIOQUIA_DIGITAL fase 1"}).count
#Equipos por tipo 
  @subregions_conteo_escritorio = @establecimientos.where(:equipment => {:tipo => "escritorio"}).count
  @subregions_conteo_portatil = @establecimientos.where(:equipment => {:tipo => "portatil"}).count
  #Equipos por Fabricante 
  @subregions_conteo_hp = @establecimientos.where(:equipment => {:fabricante => "Hewlett-Packard"}).count
  @subregions_conteo_compaq = @establecimientos.where(:equipment => {:fabricante => "compaq"}).count
  @subregions_conteo_compumax = @establecimientos.where(:equipment => {:fabricante => "Compumax M722SR"}).count                        
  end

  def index
    if current_user.superadmin?
    @principal_establecs = PrincipalEstablec.all
    else
      @join_sedes = Sede.joins('INNER JOIN principal_establecs ON  principal_establecs.dane_establec = sedes.dane_establec').where(correo: current_user.email)
      @join_establecimientos = PrincipalEstablec.joins('INNER JOIN sedes ON  sedes.dane_establec = principal_establecs.dane_establec').where(correo: current_user.email)
      @dane= @join_establecimientos[0].dane_establec
      @principal_establecs = PrincipalEstablec.where(dane_establec: @dane)
    end
    @join = Sede.joins('INNER JOIN principal_establecs pr ON  pr.dane_establec = sedes.dane_establec').where(correo: current_user.email)
  end

  # GET /principal_establecs/1
  # GET /principal_establecs/1.json
  def show
    @principal_establec = PrincipalEstablec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @principal_establec }
    end
  end

  # GET /principal_establecs/new
  # GET /principal_establecs/new.json
  def new
    @principal_establec = PrincipalEstablec.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @principal_establec }
    end
  end

  # GET /principal_establecs/1/edit
  def edit
    @principal_establec = PrincipalEstablec.find(params[:id])
  end

  # POST /principal_establecs
  # POST /principal_establecs.json
  def create
    @principal_establec = PrincipalEstablec.new(params[:principal_establec])

    respond_to do |format|
      if @principal_establec.save
        format.html { redirect_to @principal_establec, notice: 'Registro creado satisfactoriamente.' }
        format.json { render json: @principal_establec, status: :created, location: @principal_establec }
      else
        format.html { render action: "new" }
        format.json { render json: @principal_establec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /principal_establecs/1
  # PUT /principal_establecs/1.json
  def update
    @principal_establec = PrincipalEstablec.find(params[:id])

    respond_to do |format|
      if @principal_establec.update_attributes(params[:principal_establec])
        format.html { redirect_to @principal_establec, notice: 'Registro editado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @principal_establec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /principal_establecs/1
  # DELETE /principal_establecs/1.json
  def destroy
    @principal_establec = PrincipalEstablec.find(params[:id])
    @principal_establec.destroy

    respond_to do |format|
      format.html { redirect_to principal_establecs_url }
      format.json { head :no_content }
    end
  end

  def informacion_usuario
    if current_user.superadmin?
          @usuarios = Subregion.joins("inner join municipios on municipios.cod_subregion = subregions.cod_subregion")
                          .joins("inner join principal_establecs on principal_establecs.cod_municipio = municipios.cod_municipio")
                          .joins("inner join sedes on sedes.dane_establec = principal_establecs.dane_establec")
                          .select("municipios.nombre_municipio, subregions.nombre_subregion
                            ,principal_establecs.dane_establec,principal_establecs.nombre as 'Nombre_Establecimiento',
                            principal_establecs.direccion,principal_establecs.correo,sedes.nombre as 'Nombre_Sede',sedes.dane_sede")
    else
          @usuarios = Subregion.joins("inner join municipios on municipios.cod_subregion = subregions.cod_subregion")
                          .joins("inner join principal_establecs on principal_establecs.cod_municipio = municipios.cod_municipio")
                          .joins("inner join sedes on sedes.dane_establec = principal_establecs.dane_establec")
                          .select("municipios.nombre_municipio, subregions.nombre_subregion
                            ,principal_establecs.dane_establec,principal_establecs.nombre as 'Nombre_Establecimiento',
                            principal_establecs.direccion,principal_establecs.correo
                            ,sedes.nombre as 'Nombre_Sede',sedes.dane_sede")
                            .where(:principal_establecs => {:correo => current_user.email })


    end

  end

end
