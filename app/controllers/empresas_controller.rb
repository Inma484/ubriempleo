class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
 
  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.all #mostrar todas las empresas
    @empresa = Empresa.find_by_user_id(current_user.id) #buscar en la tabla empresa el user_id que sea igual al id del actual usuarios
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
  
  end

  # GET /empresas/new
  def new
    @user = current_user #guardamos en user el id del usuario atual
    @user.save # guardamos al usuario
    @empresa = Empresa.new #se crea una empresa pero no se guarda
    
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)
    @empresa.user = current_user #user_id sera el del user que este creando
    @empresa.save #aqui si se guarda 


    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: 'Empresa was successfully created.' }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'Empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:name, :direccion, :email, :web, :phone, :user_id, :logo, :descripcion)
    end
    
    
end
