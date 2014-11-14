class MunicipiosController < ApplicationController
  # GET /municipios
  # GET /municipios.json
  def index
    @municipios = Municipio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @municipios }
    end
  end

  def municipios_reporte

    
   @municipios = Subregion.joins("inner join municipios on municipios.cod_subregion = subregions.cod_subregion")
                          .joins("inner join principal_establecs on principal_establecs.cod_municipio = municipios.cod_municipio")
                          .joins("inner join sedes on sedes.dane_establec = principal_establecs.dane_establec")
                          .joins("inner join equipment on equipment.dane_sede = sedes.dane_sede")
                          .select("municipios.nombre_municipio,municipios.cod_municipio, subregions.nombre_subregion,
                            subregions.cod_subregion,principal_establecs.dane_establec,principal_establecs.nombre as 'Nombre_Establecimiento',
                            principal_establecs.direccion, sedes.nombre as 'Nombre_Sede',sedes.dane_sede,
                            equipment.tipo, equipment.disco_duro, equipment.nombre as 'Nombre_Equipo', equipment.origen,
                             equipment.fecha_entrega, equipment.fabricante")
                          .where(:municipios => {:nombre_municipio => params[:municipio]})

                          
                          
  end


  # GET /municipios/1
  # GET /municipios/1.json
  def show
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @municipio }
    end
  end

  # GET /municipios/new
  # GET /municipios/new.json
  def new
    @municipio = Municipio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @municipio }
    end
  end

  # GET /municipios/1/edit
  def edit
    @municipio = Municipio.find(params[:id])
  end

  # POST /municipios
  # POST /municipios.json
  def create
    @municipio = Municipio.new(params[:municipio])

    respond_to do |format|
      if @municipio.save
        format.html { redirect_to @municipio, notice: 'Registro creado satisfactoriamente.' }
        format.json { render json: @municipio, status: :created, location: @municipio }
      else
        format.html { render action: "new" }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /municipios/1
  # PUT /municipios/1.json
  def update
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      if @municipio.update_attributes(params[:municipio])
        format.html { redirect_to @municipio, notice: 'Registro editado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1
  # DELETE /municipios/1.json
  def destroy
    @municipio = Municipio.find(params[:id])
    @municipio.destroy

    respond_to do |format|
      format.html { redirect_to municipios_url }
      format.json { head :no_content }
    end
  end
end
