class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy ]

  # GET /reservas or /reservas.json
  def index
    # @reservas = Reserva.all
    @reservas = HTTParty.get 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/reserva'
    @tipo_reservas = HTTParty.get 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/tipo_reserva'
  end

  # GET /reservas/1 or /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    reservas_request = HTTParty.get 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/reserva'
    @reservas = JSON.parse(reservas_request.body).map {|c| [ c['desde'], c['hasta'], c['idReserva'], c['observaciones']] }
    tipo_reservas_request = HTTParty.get 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/tipo_reserva'
    @tipo_reservas = JSON.parse(tipo_reservas_request.body).map {|c| [ c['nombre'], c['idTipoReserva'] ] }
    @area_request = HTTParty.get 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/area'
    @area_padre = JSON.parse(@area_request.body).map {|c| [ c['idAreaPadre'], c['nombre'] ] }
    @area_hija = JSON.parse(@area_request.body).map {|c| [ c['idArea'], c['nombre'] ] }
    @areas = [
      {
          "descripcion": "sombreada",
          "idArea": 1,
          "nombre": "Sombra 1",
          "children": [
              {
                  "descripcion": "sombreada",
                  "idArea": 2,
                  "nombre": "Sombra"
              },
              {
                  "descripcion": "sombreada",
                  "idArea": 3,
                  "nombre": "Sombra"
              }
          ]
      },
      {
          "descripcion": "sombreada",
          "idArea": 8,
          "nombre": "Sombra 2"
      },
      {
          "descripcion": "sombreada",
          "idArea": 4,
          "nombre": "Sombra 3",
          "children": [
              {
                  "descripcion": "sombreada",
                  "idArea": 5,
                  "nombre": "Sombra"
              },
              {
                  "descripcion": "sombreada",
                  "idArea": 6,
                  "nombre": "Sombra"
              },
              {
                  "descripcion": "sombreada",
                  "idArea": 7,
                  "nombre": "Sombra"
              }
          ]
      }
    ]



    @reserva = Reserva.new

  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas or /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to reserva_url(@reserva), notice: "Reserva was successfully created." }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1 or /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to reserva_url(@reserva), notice: "Reserva was successfully updated." }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1 or /reservas/1.json
  def destroy
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to reservas_url, notice: "Reserva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.fetch(:reserva, {})
    end
end
