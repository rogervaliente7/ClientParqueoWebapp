class TipoReservasController < ApplicationController
  before_action :set_tipo_reserva, only: %i[ show edit update destroy ]

  # GET /tipo_reservas or /tipo_reservas.json
  def index
    # @tipo_reservas = TipoReserva.all
    @tipo_reservas = HTTParty.get 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/tipo_reserva'
  end

  # GET /tipo_reservas/1 or /tipo_reservas/1.json
  def show
  end

  # GET /tipo_reservas/new
  def new
    @tipo_reserva = HTTParty.get 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/tipo_reserva'
    @tipo_reserva = TipoReserva.new  
  end

  # GET /tipo_reservas/1/edit
  def edit
  end

  # POST /tipo_reservas or /tipo_reservas.json
  def create
    @tipo_reserva = TipoReserva.new(tipo_reserva_params)

    # result = RestClient::Request.execute(method: :post, url: 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/tipo_reserva',
    #   payload: JSON.parse(params[:tipo_reserva].to_json), headers: {'Content-Type' => 'application/json'})

    # result = RestClient.post( 'http://localhost:8080/ParqueoWebapp-Parcial3/resources/tipo_reserva', JSON.parse(params[:tipo_reserva].to_json),{content_type: :json, accept: :json})
     

    result = HTTParty.post('http://localhost:8080/ParqueoWebapp-Parcial3/resources/tipo_reserva', 
      :body => JSON.parse(params[:tipo_reserva].to_json).to_json,
      :headers => { 'Content-Type' => 'application/json' })

    respond_to do |format|
      if result.response.code == '201'
        format.html { redirect_to tipo_reserva_url(@tipo_reserva), notice: "Tipo reserva was successfully created." }
        format.json { render :show, status: :created, location: @tipo_reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_reservas/1 or /tipo_reservas/1.json
  def update
    respond_to do |format|
      if @tipo_reserva.update(tipo_reserva_params)
        format.html { redirect_to tipo_reserva_url(@tipo_reserva), notice: "Tipo reserva was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_reservas/1 or /tipo_reservas/1.json
  def destroy
    @tipo_reserva.destroy

    respond_to do |format|
      format.html { redirect_to tipo_reservas_url, notice: "Tipo reserva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_reserva
      @tipo_reserva = TipoReserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_reserva_params
      #params.fetch(:tipo_reserva, {:description, :nombre, :publico})
      params.require(:tipo_reserva).permit(:descripcion, :nombre, :publico)
    end

  #   def product_params 
  #     params.require(:product).permit(:title, :description, :price, :photo)
  #  end
end
