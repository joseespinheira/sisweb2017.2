class EquipamentosController < ApplicationController
  before_action :set_equipamento, only: [:show, :edit, :update, :destroy]

  # GET /equipamentos
  # GET /equipamentos.json
  def index
    @equipamentos = Equipamento.all
  end

  # GET /equipamentos/1
  # GET /equipamentos/1.json
  def show
    @equipamento = Equipamento.find params[:id]
    #@comandos = Comando.find params[:id]
    
    #@comando = Comando.find params[:id]
    #    respond_to do |format|
    #        format.html
    #        format.json {render json: @restaurante}
    #        format.xml {render xml: @restaurante}
    #    end
  end

  # GET /equipamentos/new
  def new
    preparar_form
      @equipamento = Equipamento.new
      
      if params[:comando]
        @equipamento.comando = Comando.find(params[:comando])
      end
      
      respond_to do |format|
        format.html # new.html.erb
      end
  end

  # GET /equipamentos/1/edit
  def edit
    preparar_form
  end

  # POST /equipamentos
  # POST /equipamentos.json
  def create
    @equipamento = Equipamento.new(equipamento_params)

    respond_to do |format|
      if @equipamento.save
        format.html { redirect_to @equipamento, notice: 'Equipamento was successfully created.' }
        format.json { render :show, status: :created, location: @equipamento }
      else
        preparar_form
        format.html { render :new }
        format.json { render json: @equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipamentos/1
  # PATCH/PUT /equipamentos/1.json
  def update
    @equipamento = Equipamento.find(params[:id])
    
    respond_to do |format|
      if @equipamento.update(equipamento_params)
        format.html { redirect_to @equipamento, notice: 'Equipamento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @equipamento }
      else
        preparar_form
        format.html { render :edit }
        format.json { render json: @equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipamentos/1
  # DELETE /equipamentos/1.json
  def destroy
    @equipamento.destroy
    respond_to do |format|
      format.html { redirect_to equipamentos_url, notice: 'Equipamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipamento
      @equipamento = Equipamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipamento_params
      params.require(:equipamento).permit(:nome, :comando_id)
    end
    
    def preparar_form
      @comandos = Comando.order :nome
    end
end
