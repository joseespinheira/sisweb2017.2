class ComandosController < ApplicationController
  before_action :set_comando, only: [:show, :edit, :update, :destroy]

  # GET /comandos
  # GET /comandos.json
  def index
    @comandos = Comando.all
  end

  # GET /comandos/1
  # GET /comandos/1.json
  def show
  end

  # GET /comandos/new
  def new
    @comando = Comando.new
  end

  # GET /comandos/1/edit
  def edit
  end

  # POST /comandos
  # POST /comandos.json
  def create
    @comando = Comando.new(comando_params)

    respond_to do |format|
      if @comando.save
        format.html { redirect_to @comando, notice: 'Comando was successfully created.' }
        format.json { render :show, status: :created, location: @comando }
      else
        format.html { render :new }
        format.json { render json: @comando.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comandos/1
  # PATCH/PUT /comandos/1.json
  def update
    respond_to do |format|
      if @comando.update(comando_params)
        format.html { redirect_to @comando, notice: 'Comando was successfully updated.' }
        format.json { render :show, status: :ok, location: @comando }
      else
        format.html { render :edit }
        format.json { render json: @comando.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comandos/1
  # DELETE /comandos/1.json
  def destroy
    @comando.destroy
    respond_to do |format|
      format.html { redirect_to comandos_url, notice: 'Comando was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comando
      @comando = Comando.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comando_params
      params.require(:comando).permit(:nome, :comando)
    end
end
