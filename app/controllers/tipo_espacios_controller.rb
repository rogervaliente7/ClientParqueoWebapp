class TipoEspaciosController < ApplicationController
  before_action :set_tipo_espacio, only: %i[ show edit update destroy ]

  # GET /tipo_espacios or /tipo_espacios.json
  def index
    # @tipo_espacios = TipoEspacio.all
    @tipo_espacios = HTTParty.get 'http://localhost:8080/ParqueoWebapp/resources/tipo_espacio'
  end

  # GET /tipo_espacios/1 or /tipo_espacios/1.json
  def show
  end

  # GET /tipo_espacios/new
  def new
    @tipo_espacio = TipoEspacio.new
  end

  # GET /tipo_espacios/1/edit
  def edit
  end

  # POST /tipo_espacios or /tipo_espacios.json
  def create
    @tipo_espacio = TipoEspacio.new(tipo_espacio_params)

    respond_to do |format|
      if @tipo_espacio.save
        format.html { redirect_to tipo_espacio_url(@tipo_espacio), notice: "Tipo espacio was successfully created." }
        format.json { render :show, status: :created, location: @tipo_espacio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_espacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_espacios/1 or /tipo_espacios/1.json
  def update
    respond_to do |format|
      if @tipo_espacio.update(tipo_espacio_params)
        format.html { redirect_to tipo_espacio_url(@tipo_espacio), notice: "Tipo espacio was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_espacio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_espacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_espacios/1 or /tipo_espacios/1.json
  def destroy
    @tipo_espacio.destroy

    respond_to do |format|
      format.html { redirect_to tipo_espacios_url, notice: "Tipo espacio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_espacio
      @tipo_espacio = TipoEspacio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_espacio_params
      params.fetch(:tipo_espacio, {})
    end
end
