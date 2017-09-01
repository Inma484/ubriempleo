class CurriculumsController < ApplicationController
  before_action :authenticate_user! #fuerza una auntentificaion antes de cada accion para cualquier controlador
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /curriculums
  # GET /curriculums.json
  def index
    @curriculums = Curriculum.all #mostar todos los curriculums
    @curriculum = Curriculum.find_by_user_id(current_user.id) #buscar en la tabla el id del usuario que coincida con el usuaario actual
    @categories = Category.all
  end

  # GET /curriculums/1
  # GET /curriculums/1.json
  def show
   
  end

  # GET /curriculums/new
  def new
    @curriculum = Curriculum.new
    @categories = Category.all
  end

  # GET /curriculums/1/edit
  def edit
    @categories = Category.all
  end

  # POST /curriculums
  # POST /curriculums.json
  def create
    @curriculum = Curriculum.new(curriculum_params)
    @curriculum.user = current_user #el user_id de la tabla curriculums sera el id del actual usuario


    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum }
      else
        format.html { render :new }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculums/1
  # PATCH/PUT /curriculums/1.json
  def update
    respond_to do |format|
      if @curriculum.update(curriculum_params)
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum }
      else
        format.html { render :edit }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1
  # DELETE /curriculums/1.json
  def destroy
    @curriculum.destroy
    respond_to do |format|
      format.html { redirect_to curriculums_url, notice: 'Curriculum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_params
      params.require(:curriculum).permit(:name, :apellido_1, :apellido_2, :direccion, :phone, :email, :fecha_nac, :cargo1, :cargo2, :cargo3, :datos_i, :user_id, :category_id, :avatar)
    end
end
