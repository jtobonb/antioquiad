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

    @municipios = Subregion.joins("inner join municipios mu on mu.cod_subregion = subregions.cod_subregion")
                          .joins("inner join principal_establecs pe on pe.cod_municipio = mu.cod_municipio")
                          .joins("inner join sedes se on se.dane_establec = pe.dane_establec")
                          .joins("inner join equipment eq on eq.dane_sede = se.dane_sede")
                          .select("mu.nombre_municipio,mu.cod_municipio, subregions.nombre_subregion,
                            subregions.cod_subregion,pe.dane_establec,pe.nombre 'Nombre_Establecimiento',pe.direccion,se.nombre 'Nombre_Sede', se.dane_sede,
                            eq.tipo, eq.disco_duro, eq.nombre, eq.origen, eq.fecha_entrega, eq.fabricante")
                          .where(nombre_subregion: params[:subregion])
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
