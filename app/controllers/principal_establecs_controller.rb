class PrincipalEstablecsController < ApplicationController
  # GET /principal_establecs
  # GET /principal_establecs.json
  def index
    @principal_establecs = PrincipalEstablec.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @principal_establecs }
    end
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
        format.html { redirect_to @principal_establec, notice: 'Principal establec was successfully created.' }
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
        format.html { redirect_to @principal_establec, notice: 'Principal establec was successfully updated.' }
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
end
