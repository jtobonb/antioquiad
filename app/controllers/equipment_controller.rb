class EquipmentController < ApplicationController
  # GET /equipment
  # GET /equipment.json
    def tipo
    if current_user.superadmin?
    @equipment = Equipment.where(tipo: params[:tipo])
    @equipment_conteo  = @equipment.count
    else
      @grab_dane_establecimiento = PrincipalEstablec.where(correo: current_user.email)
      @dane_establec= @grab_dane_establecimiento[0].dane_establec
      @grab_dane_sede = Sede.where(dane_establec: @dane_establec)
      @dane_sede = @grab_dane_sede[0].dane_sede
      @equipment = Equipment.where(dane_sede: [@dane_sede]).where(tipo: params[:tipo])
      @equipment_conteo  = @equipment.count

    end
  end

    def programa
    if current_user.superadmin?
       @equipment = Equipment.where(origen: params[:origen])
       @equipment_conteo  = @equipment.count
    else
      @grab_dane_establecimiento = PrincipalEstablec.where(correo: current_user.email)
      @dane_establec= @grab_dane_establecimiento[0].dane_establec
      @grab_dane_sede = Sede.where(dane_establec: @dane_establec)
      @dane_sede = @grab_dane_sede[0].dane_sede
      @equipment = Equipment.where(dane_sede: [@dane_sede]).where(origen: params[:origen])
      @equipment_conteo  = @equipment.count

    end
  end

      def reportes

      end



  
    def fecha
    if current_user.superadmin?
       @equipment = Equipment.where(fecha_entrega: params[:fecha_entrega])
       @equipment_conteo  = @equipment.count
    else
      @grab_dane_establecimiento = PrincipalEstablec.where(correo: current_user.email)
      @dane_establec= @grab_dane_establecimiento[0].dane_establec
      @grab_dane_sede = Sede.where(dane_establec: @dane_establec)
      @dane_sede = @grab_dane_sede[0].dane_sede
      @equipment = Equipment.where(dane_sede: [@dane_sede]).where(fecha_entrega: params[:fecha_entrega])
      @equipment_conteo  = @equipment.count

    end
  end

    def fabricante
    if current_user.superadmin?
       @equipment = Equipment.where(fabricante: params[:fabricante])
       @equipment_conteo  = @equipment.count
    else
      @grab_dane_establecimiento = PrincipalEstablec.where(correo: current_user.email)
      @dane_establec= @grab_dane_establecimiento[0].dane_establec
      @grab_dane_sede = Sede.where(dane_establec: @dane_establec)
      @dane_sede = @grab_dane_sede[0].dane_sede
      @equipment = Equipment.where(dane_sede: [@dane_sede]).where(fabricante: params[:fabricante])
      @equipment_conteo  = @equipment.count

    end
  end

  def index
    if current_user.superadmin?
    @equipment = Equipment.all
    @equipment_conteo = Equipment.count unless @equipment.empty?
    else
      @grab_dane_establecimiento = PrincipalEstablec.where(correo: current_user.email)
      @dane_establec= @grab_dane_establecimiento[0].dane_establec
      @grab_dane_sede = Sede.where(dane_establec: @dane_establec)
      @dane_sede = @grab_dane_sede[0].dane_sede
      @equipment = Equipment.where(dane_sede: [@dane_sede])
      @equipment_conteo  = @equipment.count
      @param_dane = Equipment.where(dane_sede: params[:dane_sede])  
     

    end
  end

  def show
    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equipment }
    end
  end

  # GET /equipment/new
  # GET /equipment/new.json
  def new
    @equipment = Equipment.new
    @param_dane =  params[:dane_sede]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @equipment }
    end
  end

  # GET /equipment/1/edit
  def edit
    @equipment = Equipment.find(params[:id])
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @equipment = Equipment.new(params[:equipment])

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Registro creado satisfactoriamente.' }
        format.json { render json: @equipment, status: :created, location: @equipment }
      else
        format.html { render action: "new" }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /equipment/1
  # PUT /equipment/1.json
  def update
    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      if @equipment.update_attributes(params[:equipment])
        format.html { redirect_to @equipment, notice: 'Registro editado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    respond_to do |format|
      format.html { redirect_to equipment_index_url }
      format.json { head :no_content }
    end
  end
end
