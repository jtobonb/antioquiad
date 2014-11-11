class PrincipalEstablecsController < ApplicationController
  # GET /principal_establecs
  # GET /principal_establecs.json
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
       @nombre = "Administrador"
       @permisos = "Super Administrador"
       @entidad = "Gobernacion de Antioquia"
       @correo = current_user.email
    else
      @grab_dane_establecimiento = PrincipalEstablec.where(correo: current_user.email)
      @dane_establec= @grab_dane_establecimiento[0].dane_establec
      @grab_dane_sede = Sede.where(dane_establec: @dane_establec)
      @dane_sede = @grab_dane_sede[0].dane_sede
      @equipment = Equipment.where(dane_sede: [@dane_sede])
      @nombre = @grab_dane_establecimiento[0].rector
      @permisos ="Administrador Establecimientos"
      @entidad="Gobernacion de Antioquia"
      @correo = current_user.email

    end

  end

end
