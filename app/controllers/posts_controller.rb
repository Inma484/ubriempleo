class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(page: params[:page], per_page:4).ultimos #mostrará de 4 en 4 los post publicados, y ordenados desde el mas actual al mas antiguo
    @categories = Category.all #podremos ver todas las categorias

    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @empresa = Empresa.find_by(params[:user_id])
   # @empresa = Empresa.find_by_user_id(current_user.id) #buscar en la tabla empresa el user_id que sea igual al id del actual usuarios

  end

  # GET /posts/new
  def new
    @post = Post.new #se crea el post pero no se guarda
    @categories = Category.all
  end

  # GET /posts/1/edit
  def edit
    @categories = Category.all

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)  #el user_id de la tabla post sera el id del usuario que actualemnte está conectado.
    
    respond_to do |format|
      if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
      else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to post_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :created_at, :user_id)
    end
end
